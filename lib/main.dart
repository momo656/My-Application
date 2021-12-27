
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/bmi/BmiResult_screen.dart';
import 'package:untitled/messnger_screen/HomeScreen.dart';
import 'package:untitled/messnger_screen/UserScreen.dart';
import 'package:untitled/bmi/bmi_screen.dart';
import 'package:untitled/bmi/contierScreen.dart';
import 'package:untitled/cubit/cubit.dart';


import 'package:untitled/messnger_screen/login_screen.dart';
import 'package:untitled/messnger_screen/messengerScreen.dart';
import 'package:untitled/network/local/cache_helper.dart';
import 'package:untitled/network/remote/dio_helper.dart';
import 'package:untitled/news_app/cubit/cubit.dart';
import 'package:untitled/shop_app/cubit/main_cubit.dart';
import 'package:untitled/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:untitled/shop_app/shop_layout/shop_layout_screen.dart';
import 'package:untitled/shop_app/shop_login/shop_login.dart';
import 'package:untitled/style/themes.dart';
import 'package:untitled/todo_app/home_layoutscreen.dart';

import 'cubit/states.dart';
import 'news_app/news_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  var token  = CacheHelper.getData(key: 'token');

  print(onBoarding);
  if(onBoarding != null){
    if(token != null) widget = ShopLayoutScreen();
    else widget = ShopLoginScreen();
  }else{
    widget = OnBoardingScreen();
  }


  runApp(MyApp(isDark,
       widget,));
}

class MyApp extends StatelessWidget
{
  final bool isDark;
  final Widget widget;


  MyApp(
      this.isDark,
      this.widget

      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness(),),
        BlocProvider(create: ( BuildContext context)=>AppCubit()..changeAppMode(
          fromShared: isDark,
        ),
        ),
        BlocProvider(create: ( BuildContext context)=>ShopCubit()..getHomeData()

        ),


      ],


        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: widget,
            );
          },
        ),

      );


  }

}

