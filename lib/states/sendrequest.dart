import 'package:flutter/material.dart';
import 'package:psugo/states/okgo.dart';
import 'package:psugo/utility/my_constant.dart';

class Sendrequest extends StatefulWidget {
  const Sendrequest({super.key});

  @override
  State<Sendrequest> createState() => _SendrequestState();
}

class _SendrequestState extends State<Sendrequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            buildRequest(context),
          ],
        ),
      ),
    );
  }

  Row buildRequest(BuildContext context) {
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
                    builder: (context) => Okgo(),
                  ));
            },
            child: Text(
              'I want to go with you',
              style: MyConstant().h1text(),
            ),
          ),
        ),
      ],
    );
  }
}
