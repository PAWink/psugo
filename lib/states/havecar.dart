import 'package:flutter/material.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_image.dart';
import 'package:psugo/widgets/show_title.dart';

class Havecar extends StatefulWidget {
  const Havecar({super.key});

  @override
  State<Havecar> createState() => _HavecarState();
}

class _HavecarState extends State<Havecar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: ListView(
            children: [
              buildSHavecar(),
              buildWpica(),
              buildPcar(),
            ],
          ),
        ));
  }

  Row buildPcar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          margin: EdgeInsets.only(top: 10),
          child: ShowImage(pathImage: MyConstant.car),
        ),
      ],
    );
  }

  Row buildWpica() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 90),
          child: ShowTitle(
            title: 'Upload your car',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }

  Row buildSHavecar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(
            title: 'I have car',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }
}
