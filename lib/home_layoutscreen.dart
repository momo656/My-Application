import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/Archvid_tasks.dart';
import 'package:untitled/done_tasks.dart';
import 'package:untitled/new_tasks.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    NewTask(),
    DoneTask(),
    ArchviedTask(),
  ];
  List<String> title = [
    'tasks',
    'done tasks',
    'Archived tasks',
  ];

  late Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  bool isBottomSheetIsShown = false;
  IconData fabIcon = Icons.add;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          title[currentIndex],
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(isBottomSheetIsShown)
            {
          if(formkey.currentState!.validate()){
            insertDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,).then((value) {
                  Navigator.pop(context);
            isBottomSheetIsShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });

                });



          }

          }else
            {
              scaffoldkey.currentState!.showBottomSheet(

                    (context) => Container(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.white,


                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: titleController,
                              onTap: (){
                                print('title tapped');
                              },
                              decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a task name',
                              labelText: 'task title',
                              prefixIcon: Icon(
                                Icons.title,
                              ),


                            ),
                              validator: ( value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },

                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: timeController,
                              onTap: (){
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timeController.text = value!.format(context).toString();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a task time',
                                labelText: 'task time',
                                prefixIcon: Icon(
                                  Icons.watch_later_outlined,
                                ),


                              ),
                              validator: ( value) {
                                if (value!.isEmpty) {
                                  return 'Please enter time';
                                }
                                return null;
                              },

                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: dateController,
                              onTap: (){
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2021-11-05')
                                ).then((value) {
                                  dateController.text = DateFormat.yMMMd().format(value!);
                                }
                                );


                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a date time',
                                labelText: 'task date',
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                ),



                              ),
                              validator: ( value) {
                                if (value!.isEmpty) {
                                  return 'Please enter time';
                                }
                                return null;
                              },

                            ),
                          ],
                        ),
                      ),
                    ),
                elevation: 20.0,
              );
              isBottomSheetIsShown = true;
              setState(() {
                fabIcon = Icons.add;
              });
            }


        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'done tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived tasks',
          ),
        ],
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,

      onOpen: (database) {
        print('Database opened');
      },
      onCreate: (database, version) {
        print('Database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error when creating table${error.toString()}');
        });
      },
    );
  }

  Future insertDatabase({
    required String title,
    required String time,
    required String date,
}) async {
    return await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks( title, date, time, status) VALUES("$title","$date","$time","new") ')

          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('error when insert new task${error.toString()}');
      });
    });
  }
}
