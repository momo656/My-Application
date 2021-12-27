import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/coponanet.dart';
import 'package:untitled/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:untitled/news_app/cubit/cubit.dart';
import 'package:untitled/news_app/cubit/states.dart';
import 'package:untitled/search_screen/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , states){},
        builder: (context , states){
          var cubit = NewsCubit.get(context);
        return  Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      navigateTo(context, searchScreen(),);
                    },
                    icon: Icon(Icons.search_rounded),
                  iconSize: 30.0,
                ),
                IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4),
                  iconSize: 30.0,
                ),
              ],

            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },

      );


  }
}
