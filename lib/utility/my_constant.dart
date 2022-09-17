import 'package:flutter/material.dart';

class MyConstant {
  //App Name
  static String appName = 'PSUGo';
  static String contin = 'Upload student ID card';

  //Route
  static String routeUploadid = '/uploadid';
  static String routeUhavecar = '/uhavecar';
  static String routePostcar = '/postcar';
  static String routeHavecar = '/havecar';
  static String routeDonthavecar = '/donthavecar';
  static String routeEmergency = '/emergency';

  //image
  static String cutlogo = 'image/cutlogo.png';
  static String picard = 'image/picard.png';
  static String cutca = 'image/cutca.png';

  //colour
  static Color primary = Color(0xffab47bc);
  static Color dark = Color(0xff790e8b);
  static Color light = Color(0xffdf78ef);

  //style
  TextStyle h1text() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2text() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3text() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
