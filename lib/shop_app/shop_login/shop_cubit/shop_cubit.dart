import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/network/remote/dio_helper.dart';
import 'package:untitled/network/remote/end_point.dart';
import 'package:untitled/shop_app/shop_login/shop_cubit/shop_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>
{
  ShopLoginCubit() : super(ShopLoginIntialState());
  static ShopLoginCubit get(context)=> BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void userLogin({
  required String email,
  required String password,
}){
    emit(ShopLoginLodingState());
  DioHelper.postData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
  ).then((value){
    print(value.data);
    loginModel = ShopLoginModel.fromJson(value.data);
    emit(ShopLoginSuccessState(loginModel));
  }).catchError((error){
    emit(ShopLoginErrorState(error.toString()));
  });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true ;
  void changePasswordVisibility ()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}