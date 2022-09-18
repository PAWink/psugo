// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psugo/states/uhavecar.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_image.dart';
import 'package:psugo/widgets/show_title.dart';

class Uploadid extends StatefulWidget {
  const Uploadid({super.key});

  @override
  State<Uploadid> createState() => _UploadidState();
}

class _UploadidState extends State<Uploadid> {
  //imgae picker1
  File? image;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            buildImagelogo(size),
            buildPhoneNum(size),
            buildWuploadid(),
            buildPicard(size),
            buildAddPic(),
            buildNext(size),
          ],
        ),
      ),
    );
  }

//image picker2
  Future<Null> chooseImage(ImageSource source) async {}
  Row buildAddPic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            color: MyConstant.dark,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            color: MyConstant.dark,
            size: 40,
          ),
        )
      ],
    );
  }

  Row buildNext(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          width: size * 0.6,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Uhavecar(),
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

  Row buildPhoneNum(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
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

  Row buildPicard(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
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
          margin: EdgeInsets.only(top: 5),
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
          margin: EdgeInsets.only(top: 80),
          width: size * 0.4,
          child: ShowImage(pathImage: MyConstant.cutlogo),
        ),
      ],
    );
  }
}
