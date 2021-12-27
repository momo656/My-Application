import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/cubit.dart';
import 'package:untitled/cubit/states.dart';
import '../coponanet.dart';

class DoneTask extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit
            .get(context).donetasks;
        return ListView.separated(
          itemBuilder: (context, index) => buldTaskItem(tasks[index],context),
          separatorBuilder: (context, index) =>
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
