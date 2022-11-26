import 'package:flutter/material.dart';

import '../utility/my_constant.dart';
import '../widgets/show_image.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final keyTrue = GlobalKey<FormState>();

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
              buildNext(size),
            ],
          ),
        ),
      ),
    );
  }

  Row buildNext(double size) {
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
              }
            },
            child: Text(
              'Next',
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
          ),
        ),
      ],
    );
  }
}
