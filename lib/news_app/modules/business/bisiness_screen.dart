import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/coponanet.dart';
import 'package:untitled/news_app/cubit/cubit.dart';
import 'package:untitled/news_app/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state){},
      builder:(context, state){
        var list =NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>BuildArticaleItem(list[index],context),
              separatorBuilder: (context,index)=>SizedBox(
          height: 20.0,
        ),
              itemCount: list.length,
        ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      } ,

    );
  }
}
