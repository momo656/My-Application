
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/cubit/cubit.dart';
import 'package:untitled/cubit/states.dart';
import 'package:untitled/todo_app/done_tasks.dart';
import 'package:untitled/todo_app/new_tasks.dart';

import '../coponanet.dart';

class LayoutScreen extends StatelessWidget {


  late Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createDatabase(),
      child:BlocConsumer<AppCubit , AppStates>(
      listener: (BuildContext context , AppStates state){
        if(state is AppInsertDatabaseState){
          Navigator.pop(context);
        }
      },
        builder:(BuildContext context , AppStates state){
        AppCubit cubit = AppCubit.get(context);
         return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.currentIndex],
              ),
            ),
            body:cubit.screens[cubit.currentIndex],



            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(cubit.isBottomSheetIsShown)
                {
                  cubit.insertDatabase(title: titleController.text, time: timeController.text, date: dateController.text);

                    cubit.changeBottomSheetState(isShow: false, icon:Icons.edit, );




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
                  cubit.changeBottomSheetState(isShow: true, icon:Icons.add, );

                }


              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
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
        } ,
      ),
    );
  }


}


