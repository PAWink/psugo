import 'package:flutter/material.dart';
import 'package:psugo/states/uploadid.dart';

import '../utility/my_constant.dart';
import '../widgets/show_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //ทำให้พิมพ์อีเมลและพาสเวิดถูกต้องตามแบบ
  final keyTrue = GlobalKey<FormState>();
  //ตัวแปรเก็บอีเมลและพาสเวิด
  late String name, email, password;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Form(
          key: keyTrue,
          child: ListView(
            children: [
              buildLogo(size),
              buildName(size),
              buildEmail(size),
              buildPassword(size),
              buildRegis(size),
            ],
          ),
        ),
      ),
    );
  }

//เชื่อมต่อไฟรเบส
  Future<void> registerMethod() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((response) {
      print('Regis success');
      //แสดงชื่อ
      setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
      myAlert(title, message);
    });
  }

  //แจ้งเตือน
  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

//แสดงชื่อ display name
  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    var user = firebaseAuth.currentUser;
    if (user != null) {
      // ignore: deprecated_member_use
      user.updateProfile(displayName: name);

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Uploadid());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  Row buildRegis(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: size * 0.6,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (keyTrue.currentState!.validate()) {
                keyTrue.currentState!.save();
                print('name = $name, emali = $email, password = $password');
                registerMethod();
              }
            },
            child: Text(
              'Register',
              style: MyConstant().h2text(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Name :',
              prefixIcon: Icon(
                Icons.person_outline_sharp,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
            onSaved: (String? value) {
              name = value!.trim();
            },
          ),
        ),
      ],
    );
  }

  Row buildLogo(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: size * 0.8,
          child: ShowImage(pathImage: MyConstant.cutlogo),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Password :',
              prefixIcon: Icon(
                Icons.password,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value!.length < 6) {
                return 'Password More 6 digit';
              } else {
                return null;
              }
            },
            onSaved: (String? value) {
              password = value!.trim();
            },
          ),
        ),
      ],
    );
  }

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Email :',
              prefixIcon: Icon(
                Icons.email,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (!((value!.contains('@')) && (value.contains('.')))) {
                return 'Email have @';
              } else {
                return null;
              }
            },
            onSaved: (String? value) {
              email = value!.trim();
            },
          ),
        ),
      ],
    );
  }
}
