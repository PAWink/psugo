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
  File? file;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            buildImagelogo(size),
            buildProfile(),
            buildAddPic(),
            buildNickname(size),
            buildFaculty(size),
            buildID(size),
            buildPhoneNum(size),
            buildNext(size),
          ],
        ),
      ),
    );
  }

  Row buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          margin: EdgeInsets.only(top: 30),
          child: ShowImage(pathImage: MyConstant.cutprof),
        ),
      ],
    );
  }

  Row buildID(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'ID:',
              prefixIcon: Icon(
                Icons.password,
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

  Row buildFaculty(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Faculty :',
              prefixIcon: Icon(
                Icons.people_alt_outlined,
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

  Row buildNickname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Nickname :',
              prefixIcon: Icon(
                Icons.people,
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

//image picker2
  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

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
          margin: EdgeInsets.symmetric(vertical: 20),
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

  Row buildImagelogo(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.4,
          child: ShowImage(pathImage: MyConstant.cutlogo),
        ),
      ],
    );
  }
}
