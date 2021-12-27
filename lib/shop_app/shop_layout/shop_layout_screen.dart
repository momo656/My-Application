import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/network/local/cache_helper.dart';
import 'package:untitled/shop_app/cubit/main_cubit.dart';
import 'package:untitled/shop_app/cubit/main_states.dart';
import 'package:untitled/shop_app/search/search_screen.dart';
import 'package:untitled/shop_app/shop_login/shop_login.dart';

import '../../coponanet.dart';

class ShopLayoutScreen extends StatelessWidget {
  const ShopLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(

        listener: (context, state) {} ,
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
         return Scaffold(
            appBar: AppBar(
              title: Text(
                'Shop',

              ),
              actions: [IconButton(onPressed: (){
                navigateTo(context,searchScreenShop());
              }, icon: Icon(Icons.search))],
            ),
            body:cubit.bottomScreens[cubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
             onTap: (index){
               cubit.changeBottom(index);
             },
             currentIndex: cubit.currentIndex,
             items: [
               BottomNavigationBarItem(icon: Icon(Icons.home),
               label: 'home '),
               BottomNavigationBarItem(icon: Icon(Icons.app_registration),
               label: 'category'),
               BottomNavigationBarItem(icon: Icon(Icons.favorite),
               label: 'favorites'),
               BottomNavigationBarItem(icon: Icon(Icons.settings),
               label: 'settings'),
             ],
           ),


          );
        },
        );
  }
}
