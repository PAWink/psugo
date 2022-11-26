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
  static String routePosted = '/posted';
  static String routeLogIn = '/login';
  static String routeSignIn = '/signin';
  static String routeSpla = '/spla';
  static String routeMyprofile = '/myprofile';

  //image
  static String cutlogo = 'image/cutlogo.png';
  static String picard = 'image/picard.png';
  static String cutca = 'image/cutca.png';
  static String driving = 'image/driving.png';
  static String driving2 = 'image/driving2.png';
  static String car = 'image/car.png';
  static String cutgall = 'image/cutgall.png';
  static String cutprof = 'image/cutprof.png';

  //colour
  static Color primary = Color(0xff0000cd);
  static Color dark = Color.fromARGB(255, 24, 51, 126);
  static Color light = Color.fromARGB(255, 255, 255, 255);

  //style
  TextStyle h1text() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2text() => TextStyle(
        fontSize: 18,
        color: light,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3text() => TextStyle(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
