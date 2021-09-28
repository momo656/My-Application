
import 'package:flutter/material.dart';
import 'package:untitled/BmiResult_screen.dart';
import 'package:untitled/HomeScreen.dart';
import 'package:untitled/UserScreen.dart';
import 'package:untitled/bmi_screen.dart';
import 'package:untitled/contierScreen.dart';
import 'package:untitled/home_LayoutScreen.dart';

import 'package:untitled/login_screen.dart';
import 'package:untitled/messengerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );

  }

}

