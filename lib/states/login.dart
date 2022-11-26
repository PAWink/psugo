import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psugo/states/uploadid.dart';

import '../utility/my_constant.dart';
import '../widgets/show_image.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //ทำให้พิมพ์อีเมลและพาสเวิดถูกต้องตามแบบ
  final keyTrue = GlobalKey<FormState>();
  //ตัวแปรเก็บอีเมลและพาสเวิด
  late String email, password;

  Future<void> checkAuthenLogin() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) {
      print('Authen success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Uploadid());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
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
              buildEmail(size),
              buildPassword(size),
              buildLogin(size)
            ],
          ),
        ),
      ),
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

  Row buildLogin(double size) {
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
                print('emali = $email, password = $password');
                checkAuthenLogin();
              }
            },
            child: Text(
              'Login',
              style: MyConstant().h2text(),
            ),
          ),
        ),
      ],
    );
  }
}
