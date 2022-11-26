import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psugo/states/login.dart';
import 'package:psugo/states/myprofile.dart';
import 'package:psugo/states/signin.dart';
import 'package:psugo/states/uploadid.dart';

import '../utility/my_constant.dart';
import '../widgets/show_image.dart';

class Spla extends StatefulWidget {
  const Spla({super.key});

  @override
  State<Spla> createState() => _SplaState();
}

class _SplaState extends State<Spla> {
  //method ที่ทำงานก่อน build
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  //เช็คสถานะ ถ้ายังลอกอินอยู่ให้ไปหน้ามายโปรไฟล์
  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // ignore: await_only_futures
    var user = await firebaseAuth.currentUser;
    if (user != null) {
      // ignore: prefer_const_constructors
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Myprofile());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: ListView(
          children: [
            buildLogo(size),
            buildLogin(size),
            buildSignin(size),
          ],
        ),
      ),
    );
  }

  Row buildSignin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: size * 0.6,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ));
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
}
