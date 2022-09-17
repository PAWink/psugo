// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_image.dart';
import 'package:psugo/widgets/show_title.dart';

class Uploadid extends StatefulWidget {
  const Uploadid({super.key});

  @override
  State<Uploadid> createState() => _UploadidState();
}

class _UploadidState extends State<Uploadid> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: ListView(
          children: [
            buildImagelogo(size),
            buildPhoneNum(size),
            buildWuploadid(),
            buildPicard(size),
            buildTakePho(size),
          ],
        ),
      ),
    );
  }

  Row buildPhoneNum(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Phone number :',
              prefixIcon: Icon(
                Icons.phone,
                color: MyConstant.light,
              ),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTakePho(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: size * 0.2,
          child: ShowImage(pathImage: MyConstant.cutca),
        ),
      ],
    );
  }

  Row buildPicard(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          width: size * 0.6,
          child: ShowImage(pathImage: MyConstant.picard),
        )
      ],
    );
  }

  Row buildWuploadid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          child: ShowTitle(
            title: MyConstant.contin,
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }

  Row buildImagelogo(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          width: size * 0.6,
          child: ShowImage(pathImage: MyConstant.cutlogo),
        ),
      ],
    );
  }
}
