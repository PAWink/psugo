import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psugo/states/splash.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  //ปุ่มออกจากระบบ
  Widget signOutB() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'Sign out',
      onPressed: () {
        Navigator.of(context).pop();
        processSignOut();
      },
    );
  }

  //คุยกับไฟรเบสออกจากระบบ
  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Spla());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
        actions: <Widget>[signOutB()],
      ),
      body: Text('body'),
    );
  }
}
