import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favoretiesScreen extends StatelessWidget {
  const favoretiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'favoreties screen',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
