import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/network/remote/dio_helper.dart';
import 'package:untitled/news_app/cubit/states.dart';
import 'package:untitled/news_app/modules/business/bisiness_screen.dart';
import 'package:untitled/news_app/modules/science/science_screen.dart';
import 'package:untitled/news_app/modules/sports/sports_screen.dart';
import 'package:untitled/seting_screens/seting_screen.dart';

class NewsCubit extends Cubit<NewsStates>{


  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0 ;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(
      Icons.business_center_rounded,
    ),
      label: 'business'
    ),
    BottomNavigationBarItem(icon: Icon(
      Icons.sports,
    ),
        label: 'sports'
    ),
    BottomNavigationBarItem(icon: Icon(
      Icons.science,
    ),
        label: 'science'
    ),
    BottomNavigationBarItem(icon: Icon(
      Icons.settings,
    ),
        label: 'setting'
    ),

  ];
  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];
  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(NewsBottomNavState());
  }
  List<dynamic> business=[];
  void getBusiness ()
  {
    emit(NewsGetBusinessLoadingState());
   DioHelper.getData(
       url: 'v2/top-headlines',
       query: {
         'country':'eg',
         'category':'business',
         'apiKey':'d008ad3bf25945d7a40bf97f8e2ef167',
        

       },
   ).then((value) {
    // print(value.data['articles'][0]['title']);
     business = value.data['articles'];
     print(business[0]['title']);
     emit(NewsGetBusinessSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(NewsGetBusinessErrorState(error.toString()));
   });
  }
  List<dynamic> sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'d008ad3bf25945d7a40bf97f8e2ef167',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }


  }
  List<dynamic> science=[];
  void getScience ()
  {
    if(science.length==0){
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'d008ad3bf25945d7a40bf97f8e2ef167',


        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }
  List<dynamic> search=[];
  void getSearch (String value)
  {
    emit(NewsGetSearchLoadingState());
    search=[];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'d008ad3bf25945d7a40bf97f8e2ef167',
      },
    ).then((value) {
      print(search);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error,stacktrace){
      print(error);
      print(stacktrace);
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

}