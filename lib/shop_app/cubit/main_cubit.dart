import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/network/remote/dio_helper.dart';
import 'package:untitled/network/remote/end_point.dart';
import 'package:untitled/search_screen/search_screen.dart';
import 'package:untitled/shop_app/cateogries/cateogries_screen.dart';
import 'package:untitled/shop_app/cubit/main_states.dart';
import 'package:untitled/shop_app/favoretes/favoreties_screen.dart';
import 'package:untitled/shop_app/products/products_screen.dart';
import 'package:untitled/shop_app/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super (ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0 ;
  List<Widget> bottomScreens =
  [
    productsScreen(),
    cateogriesScreen(),
    favoretiesScreen(),
    settingsScreen(),

  ];
  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
   HomeModel homeModel = HomeModel();
  void getHomeData(){
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, ).then((value){
     homeModel = HomeModel.fromJson(value.data);
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      emit(ShopErrorHomeDataState());

    });

}
}