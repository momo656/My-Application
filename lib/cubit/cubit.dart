import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/cubit/states.dart';
import 'package:untitled/network/local/cache_helper.dart';

import '../todo_app/archvid_tasks.dart';
import '../todo_app/done_tasks.dart';
import '../todo_app/new_tasks.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());


  static AppCubit get(context)=> BlocProvider.of(context);
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
  void changeIndex(int index)
  {
    currentIndex =index;
    emit(AppChangeBottomNavState());
  }
  late Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];
  void createDatabase()  {
     openDatabase(
      'database.db',
      version: 1,

      onOpen: (database) {
        getDataFromDatabase(database);
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
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

   insertDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn)  async {
     txn.rawInsert(
          'INSERT INTO tasks( title, date, time, status) VALUES("$title","$date","$time","new") '
     ).then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);

      }).catchError((error) {
        print('error when insert new task${error.toString()}');
      });
    });
  }
  void getDataFromDatabase(database) {
    newtasks = [];
    donetasks = [];
    archivedtasks = [];
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value){

      value.forEach((element) {
        if(element['status']=='new')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
        else archivedtasks.add(element);
      });
      emit(AppGetDatabaseState());

    });
  }
  void updateData({
      required String status,
      required int id,
}) async{
     database.rawUpdate(
    'UPDATE tasks SET status = ?  WHERE id = ?',
    ['$status',  id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
     });


  }
  void deleteData({
    required int id,
  }) async{
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });


  }
  bool isBottomSheetIsShown = false;
  IconData fabIcon = Icons.add;
  void changeBottomSheetState(
  {
  required bool isShow,
  required IconData icon,
}){
    isBottomSheetIsShown= isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());

  }
  bool isDark= false;
  void changeAppMode({ bool? fromShared}){
    if(fromShared != null)
      isDark=fromShared;
    else
    isDark=!isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });

  }
}