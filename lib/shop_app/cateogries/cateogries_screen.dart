import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cateogriesScreen extends StatelessWidget {
  const cateogriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'cateogries screen',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
