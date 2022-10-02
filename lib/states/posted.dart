import 'package:flutter/material.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_title.dart';

class Posted extends StatefulWidget {
  const Posted({super.key});

  @override
  State<Posted> createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: ListView(
            children: [
              buildPosted(),
            ],
          ),
        ));
  }

  Row buildPosted() {
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
            title: 'Posted',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }
}
