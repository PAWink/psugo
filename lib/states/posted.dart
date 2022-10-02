import 'package:flutter/material.dart';
import 'package:psugo/states/sendrequest.dart';
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
    //size
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: ListView(
            children: [
              buildPosted(),
              buildChoosePost(size),
            ],
          ),
        ));
  }

  Row buildChoosePost(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.black,
          width: size * 0.6,
          margin: EdgeInsets.all(60),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sendrequest(),
                  ));
            },
            child: Text(
              'Start from PSU Phuket , Time to start: 14.30',
              style: MyConstant().h2text(),
            ),
          ),
        ),
      ],
    );
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
