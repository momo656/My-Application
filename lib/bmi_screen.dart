
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/BmiResult_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
{
  bool isMale= true;
  double height = 120.0;
  int wieght = 50 ;
  int age = 20 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMICalculator'
        ),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.blue : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/male.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                                'male',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(()
                        {
                         isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.grey[300] : Colors.blue ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/female.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'female',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[300],
          ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Cm',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged: (value){
                        setState(() {
                        height = value;
                        });


                      },
                    ),

                  ],
                ),
              ),
            ),

          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$wieght',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      wieght--;
                                    });
                                  },
                                  heroTag: 'wieght-',
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      wieght++;
                                    });
                                  },
                                  heroTag: 'wieght+',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });

                                  },
                                  heroTag: 'age-',
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'age+',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],

                        ),
                      ),
                    ),


                  ],

                ),
              ),
          ),
          Container(
              width: double.infinity,
              color: Colors.blue,
              
              child: MaterialButton(
                onPressed:(){
                 double result = wieght / pow( height / 100,2);
                 print(result.round());
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context)=>BmiResultScreen(
                         age:age,
                         result:result.round(),
                         isMale:isMale,
                       ),
                     ),
                 );
              },
                height: 50.0,
                child: Text(
                  'calculate',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
