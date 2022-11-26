import 'package:flutter/material.dart';
import 'package:psugo/states/login.dart';
import 'package:psugo/states/signin.dart';

import '../utility/my_constant.dart';
import '../widgets/show_image.dart';

class Spla extends StatefulWidget {
  const Spla({super.key});

  @override
  State<Spla> createState() => _SplaState();
}

class _SplaState extends State<Spla> {
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
              'Log in',
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
