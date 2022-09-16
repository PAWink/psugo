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
      body: SafeArea(
        child: ListView(
          children: [
            buildImagelogo(size),
            buildWuploadid(),
            buildPicard(size),
            buildPica(size)
          ],
        ),
      ),
    );
  }

  Row buildPica(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.5,
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
          width: size * 0.75,
          child: ShowImage(pathImage: MyConstant.picard),
        )
      ],
    );
  }

  Row buildWuploadid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: MyConstant.contin, textStyle: MyConstant().h1text()),
      ],
    );
  }

  Row buildImagelogo(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(pathImage: MyConstant.cutlogo),
        ),
      ],
    );
  }
}
