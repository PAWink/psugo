import 'package:flutter/material.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_title.dart';

class Postcar extends StatefulWidget {
  const Postcar({super.key});

  @override
  State<Postcar> createState() => _PostcarState();
}

class _PostcarState extends State<Postcar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
            child: ListView(
          children: [
            buildPost(),
            buildWstat(),
            buildWto(),
          ],
        )));
  }

  Row buildWto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(title: 'To', textStyle: MyConstant().h1text()),
        ),
      ],
    );
  }

  Row buildWstat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(
            title: 'Start from PSU Phuket',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }

  Row buildPost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          width: 300,
          color: Colors.blue,
          margin: EdgeInsets.only(top: 60),
          child: ShowTitle(
            title: 'Post',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }
}
