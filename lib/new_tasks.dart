import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New tasks',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,

        ),
      ),
    );
  }
}
