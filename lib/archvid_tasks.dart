
import 'package:flutter/material.dart';

class ArchviedTask extends StatelessWidget {
  const ArchviedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Archived tasks',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,

        ),
      ),
    );
  }
}
