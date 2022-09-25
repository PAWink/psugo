// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psugo/states/postcar.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_image.dart';
import 'package:psugo/widgets/show_title.dart';

class Havecar extends StatefulWidget {
  const Havecar({super.key});

  @override
  State<Havecar> createState() => _HavecarState();
}

class _HavecarState extends State<Havecar> {
  //imgae picker1
  File? fileCar;
  File? fileLicense;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: ListView(
            children: [
              buildSHavecar(),
              buildWpica(),
              buildPicCar(size),
              buildWLicense(),
              buildPicLicense(size),
              buildNext(context)
            ],
          ),
        ));
  }

  //image picker Car
  Future<Null> chooseImageCar(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );
      setState(() {
        fileCar = File(result!.path);
      });
    } catch (e) {}
  }

  //image picker License
  Future<Null> chooseImageLicense(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );
      setState(() {
        fileLicense = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildPicCar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.only(left: 70),
          onPressed: () => chooseImageCar(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            width: size * 0.3,
            child: fileCar == null
                ? ShowImage(pathImage: MyConstant.car)
                : Image.file(fileCar!)),
        IconButton(
          padding: EdgeInsets.only(right: 90),
          onPressed: () => chooseImageCar(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
      ],
    );
  }

  Row buildPicLicense(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.only(left: 70),
          onPressed: () => chooseImageLicense(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            width: size * 0.3,
            child: fileLicense == null
                ? ShowImage(pathImage: MyConstant.driving)
                : Image.file(fileLicense!)),
        IconButton(
          padding: EdgeInsets.only(right: 90),
          onPressed: () => chooseImageLicense(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
      ],
    );
  }

  Row buildNext(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 200,
          margin: EdgeInsets.symmetric(vertical: 50),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Postcar()),
                  ));
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

  Row buildWLicense() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          child: ShowTitle(
            title: 'Upload driving license',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }

  Row buildWpica() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
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
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          height: 60,
          width: 300,
          color: Colors.blue,
          margin: EdgeInsets.symmetric(vertical: 40),
          child: ShowTitle(
            title: 'I have car',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }
}
