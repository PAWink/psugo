import 'package:flutter/material.dart';
import 'package:psugo/states/posted.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_title.dart';

class Postcar extends StatefulWidget {
  const Postcar({super.key});

  @override
  State<Postcar> createState() => _PostcarState();
}

class _PostcarState extends State<Postcar> {
  //set time
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  @override
  Widget build(BuildContext context) {
    //size
    double size = MediaQuery.of(context).size.width;
    //time
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
            child: ListView(
          children: [
            buildPost(),
            buildWstat(),
            buildWto(),
            buildWaytogo(size),
            buileShowTime(),
            buildSetTime(),
            buildNext(size),
          ],
        )));
  }

  Row buildSetTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: ElevatedButton(
          child: Text('Select time'),
          onPressed: () async {
            TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: time,
            );
            //cencle time
            if (newTime == null) return;
            //ok
            setState(() => time = newTime);
          },
        )),
      ],
    );
  }

  Row buileShowTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Text(
            '${time.hour}:${time.minute}',
            style: MyConstant().h1text(),
          ),
        ),
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
                    builder: (context) => Posted(),
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

  Row buildWaytogo(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Way to go: ',
              prefixIcon: Icon(
                Icons.map,
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
