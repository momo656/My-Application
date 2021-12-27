import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/shop_app/cubit/main_cubit.dart';
import 'package:untitled/shop_app/cubit/main_states.dart';

class productsScreen extends StatelessWidget {
  const productsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(

      listener: (context, state){},
      builder: (context, state)
      {
        var cubit = ShopCubit.get(context);
         return ConditionalBuilder(
          condition: state is! ShopLoadingHomeDataState  ,
          builder: (context)=>productsBuilder(cubit.homeModel),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
          );

      },
    );

  }
  Widget productsBuilder(HomeModel model)=> Column(
    children:
    [
    CarouselSlider(
      items: model.data?.banners?.map((e) => Image(
  image: NetworkImage('${e.image}'),
  width: double.infinity,
  fit: BoxFit.cover,
  ),).toList(),
      options: CarouselOptions(
        height: 250.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    ),
    ],
  );
}
