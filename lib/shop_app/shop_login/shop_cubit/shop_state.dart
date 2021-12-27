import 'package:untitled/models/shop_app/login_model.dart';

abstract class ShopLoginState{}

class ShopLoginIntialState extends ShopLoginState{}

class ShopLoginLodingState extends ShopLoginState{}

class ShopLoginSuccessState extends ShopLoginState{
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);

}

class ShopLoginErrorState extends ShopLoginState{
   final String error;
  ShopLoginErrorState(this.error);


}
class ShopChangePasswordVisibilityState extends ShopLoginState{}
