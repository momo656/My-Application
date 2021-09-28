import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(icon: Icon(
            Icons.notification_important,
          ),
            onPressed: OnNotification, ),
        IconButton(icon:
          Icon(
            Icons.search,
          ),
            onPressed: ()
          {
          print
              ('hello');
            },
         ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Text(
                  'first Text',
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Text(
                  'second Text',
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                child: Text(
                  'therd Text',
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Text(
                  'fourth Text',
                ),
              ),
            ),



          ],

        ),
      ),
    );
  }
    void OnNotification()
    {
      print("print notification");
    }

  }

