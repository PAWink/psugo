// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:psugo/states/donthavecar.dart';
import 'package:psugo/states/havecar.dart';

class Uhavecar extends StatefulWidget {
  const Uhavecar({super.key});

  @override
  State<Uhavecar> createState() => _UhavecarState();
}

class _UhavecarState extends State<Uhavecar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            buildRouteHaveCar(context),
            buildRouteDontHaveCar(context),
          ],
        ),
      ),
    );
  }

  Row buildRouteDontHaveCar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Donthavecar(),
                  ));
            },
            child: Text('Don\'t have car'),
          ),
        ),
      ],
    );
  }

  Row buildRouteHaveCar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 300),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Havecar(),
                  ));
            },
            child: Text('Have car'),
          ),
        ),
      ],
    );
  }
}
