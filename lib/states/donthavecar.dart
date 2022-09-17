import 'package:flutter/material.dart';
import 'package:psugo/states/postcar.dart';
import 'package:psugo/states/posted.dart';
import 'package:psugo/utility/my_constant.dart';
import 'package:psugo/widgets/show_title.dart';

class Donthavecar extends StatefulWidget {
  const Donthavecar({super.key});

  @override
  State<Donthavecar> createState() => _DonthavecarState();
}

class _DonthavecarState extends State<Donthavecar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            buildWidonthavecar(),
            Container(
              width: 50,
              height: 90,
              margin: EdgeInsets.only(top: 16),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Posted(),
                        ));
                  },
                  child: Text(
                    'Find car',
                    style: MyConstant().h1text(),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Row buildWidonthavecar() {
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
              title: 'I don\'t have car', textStyle: MyConstant().h1text()),
        ),
      ],
    );
  }
}
