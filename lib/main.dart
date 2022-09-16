import 'package:flutter/material.dart';
import 'package:psugo/states/donthavecar.dart';
import 'package:psugo/states/emergency.dart';
import 'package:psugo/states/havecar.dart';
import 'package:psugo/states/postcar.dart';
import 'package:psugo/states/uhavecar.dart';
import 'package:psugo/states/uploadid.dart';
import 'package:psugo/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/uploadid': (BuildContext context) => Uploadid(),
  '/uhavecar': (BuildContext context) => Uhavecar(),
  '/postcar': (BuildContext context) => Postcar(),
  '/havecar': (BuildContext context) => Havecar(),
  '/donthavecar': (BuildContext context) => Donthavecar(),
  '/emergency': (BuildContext context) => Emergency(),
};

String? initlalRoute;

void main() {
  initlalRoute = MyConstant.routeUploadid;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
