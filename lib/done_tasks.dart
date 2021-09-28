
import 'package:flutter/material.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'done tasks',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.0,

      ),
      ),
    );
  }
}
