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
  //drop down
  List<String> items = [
    'The President\' office',
    'Canteen',
    'Building 6',
    'Library'
  ];
  String selectedItem = 'The President\' office';
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
            buildWstart(),
            buildPointstart(size),
            buildWto(),
            buildWaytogo(size),
            buildWseat(),
            buildNumseat(size),
            buildWprice(),
            buildPrice(size),
            buildWtime(),
            buileShowTime(),
            buildSetTime(),
            buildNext(size),
          ],
        )));
  }

  Row buildWstart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(title: 'Start', textStyle: MyConstant().h1text()),
        ),
      ],
    );
  }

  Row buildWtime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(title: 'Time', textStyle: MyConstant().h1text()),
        ),
      ],
    );
  }

  Row buildPrice(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Price: ',
              prefixIcon: Icon(
                Icons.attach_money_sharp,
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

  Row buildWprice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(title: 'Price', textStyle: MyConstant().h1text()),
        ),
      ],
    );
  }

  Row buildNumseat(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3text(),
              labelText: 'Number of seats: ',
              prefixIcon: Icon(
                Icons.people_alt,
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

  Row buildWseat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ShowTitle(
              title: 'Number of seats', textStyle: MyConstant().h1text()),
        ),
      ],
    );
  }

//Choose Start point
  Row buildPointstart(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.7,
          child: SizedBox(
            height: 80,
            width: 200,
            child: DropdownButtonFormField(
              hint: Text('choose'),
              dropdownColor: Colors.blue[200],
              decoration: InputDecoration(
                  prefixText: 'Start: ',
                  prefixIcon: Icon(Icons.people),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (item) => setState(
                () => selectedItem = item!,
              ),
            ),
          ),
        ),
      ],
    );
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
