import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: ListView(
            children: [
              buildSHavecar(),
              buildWpica(),
              buildPicar(),
              buildTakePho(),
              buildWLicense(),
              buildPicLicense(),
              buildPicarLi(),
              buildNext(context)
            ],
          ),
        ));
  }

  Row buildNext(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Postcar()),
                  ));
            },
            child: Text('Next'),
          ),
        ),
      ],
    );
  }

  Row buildPicarLi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          height: 60,
          child: ShowImage(pathImage: MyConstant.cutca),
        ),
      ],
    );
  }

  Row buildPicLicense() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          margin: EdgeInsets.only(top: 30),
          child: ShowImage(pathImage: MyConstant.driving),
        ),
      ],
    );
  }

  Row buildWLicense() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          child: ShowTitle(
            title: 'Upload driving license',
            textStyle: MyConstant().h1text(),
          ),
        ),
      ],
    );
  }

  Row buildTakePho() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          margin: EdgeInsets.only(top: 30),
          child: ShowImage(pathImage: MyConstant.cutca),
        ),
      ],
    );
  }

  Row buildPicar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          margin: EdgeInsets.only(top: 30),
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
