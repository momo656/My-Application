
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {

  final int result;
  final int age;
  final bool isMale;
  BmiResultScreen({
    required this.result,
    required this.age,
    required this.isMale,

});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (
        Text(
          'BMiResult',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),

        )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'gender: ${isMale? 'male' : 'female'}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),

            ),
            Text(
              'Result:$result',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),

            ),
            Text(
          'Age:$age',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),

        ),
          ],
        ),
      ),
    );
  }
}
