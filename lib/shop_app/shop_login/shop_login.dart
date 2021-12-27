import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/network/local/cache_helper.dart';
import 'package:untitled/shop_app/register/register_screen.dart';
import 'package:untitled/shop_app/shop_layout/shop_layout_screen.dart';
import 'package:untitled/shop_app/shop_login/shop_cubit/shop_cubit.dart';
import 'package:untitled/shop_app/shop_login/shop_cubit/shop_state.dart';

import '../../coponanet.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController =TextEditingController();
    var passwordController =TextEditingController();

    return BlocProvider(
      create: (BuildContext context)=> ShopLoginCubit(),

      child:BlocConsumer<ShopLoginCubit , ShopLoginState >(
        listener: (context ,state){
          if(state is ShopLoginSuccessState)
            {
              if(state.loginModel.status)
              {
                CacheHelper.saveData(key: 'token', value: state.loginModel.data.token,).then((value){
                  navigationAndFinish(context,ShopLayoutScreen());
                });

                print(state.loginModel.data.token);

              }else{
                Fluttertoast.showToast(
                    msg: state.loginModel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                print(state.loginModel.message);
              }

            }
        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child:SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline5,



                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'please enter your email address';
                            }
                          },
                          decoration:InputDecoration(
                            prefixIcon:Icon(Icons.email_outlined ),
                            labelText:'Email Address' ,
                            focusedBorder: OutlineInputBorder(

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller:passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return ' password is too short';
                            }

                          },
                          obscureText: ShopLoginCubit.get(context).isPassword,
                          decoration:InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                ShopLoginCubit.get(context).changePasswordVisibility();
                              },
                              child: Icon(ShopLoginCubit.get(context).suffix),
                            ),
                            prefixIcon:Icon(Icons.lock_outline),
                            labelText:'Password' ,

                            focusedBorder: OutlineInputBorder(
                            ),

                          ),

                        ),
                        SizedBox(
                          height:30.0 ,
                        ),
                        ConditionalBuilder(
                           condition: state is! ShopLoginLodingState ,
                          builder: (context)=>Container(
                            width: double.infinity,
                            color: Colors.blue,
                            child: MaterialButton (onPressed: (){
                              if(formKey.currentState!.validate()){
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                            },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,

                                ),

                              ),
                            ),
                          ),
                          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "don't have account?"
                            ),
                            TextButton(onPressed: (){
                              navigateTo(context, RegisterScreen(),);
                            }, child: Text(
                                'Resister Now'

                            ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )

    );
  }
}
