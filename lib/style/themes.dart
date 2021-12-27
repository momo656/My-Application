import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(

  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(

    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyText1:TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline5:TextStyle(
      color: Colors.white,
    ),
    headline6:TextStyle(
      color: Colors.grey,
    ),

  ),
  scaffoldBackgroundColor:HexColor('333739'),
);
ThemeData lightTheme = ThemeData(
primarySwatch: Colors.deepOrange,
scaffoldBackgroundColor: Colors.white,
appBarTheme: AppBarTheme(
backwardsCompatibility: false,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark,
),
backgroundColor: Colors.white,
elevation: 0.0,
titleTextStyle: TextStyle(
color: Colors.black,
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
actionsIconTheme: IconThemeData(
color: Colors.black,
),
),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor: Colors.deepOrange,
elevation: 20.0,

),
textTheme: TextTheme(
bodyText1:TextStyle(
fontSize: 18.0,
fontWeight: FontWeight.w600,
color: Colors.black,
),
),
);