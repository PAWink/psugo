import 'package:flutter/material.dart';
import 'package:psugo/states/emergency.dart';
import 'package:psugo/utility/my_constant.dart';

class Okgo extends StatefulWidget {
  const Okgo({super.key});

  @override
  State<Okgo> createState() => _OkgoState();
}

class _OkgoState extends State<Okgo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            buildOkgo(context),
          ],
        ),
      ),
    );
  }

  Row buildOkgo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 60,
          margin: EdgeInsets.symmetric(vertical: 300),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Emergency(),
                  ));
            },
            child: Text(
              'OK go',
              style: MyConstant().h1text(),
            ),
          ),
        ),
      ],
    );
  }
}
