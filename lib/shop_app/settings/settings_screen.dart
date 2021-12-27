import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'settings screen',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
