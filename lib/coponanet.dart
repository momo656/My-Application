


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shop_app/shop_login/shop_login.dart';
import 'package:untitled/web_view/web_view_screen.dart';

import 'cubit/cubit.dart';
import 'network/local/cache_helper.dart';


Widget buldTaskItem(Map modle,context)=>Dismissible(
  key: Key(modle['id'].toString()),
  child: Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text(

              '${modle['time']}'

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,

            children: [

              Text(

                '${modle['title']}',

                style: TextStyle(

                  fontSize: 18.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

              SizedBox(

                height: 5.0,

              ),

              Text(

                '${modle['date']}',

                style: TextStyle(

                    fontSize: 18.0,

                    color: Colors.grey

                ),

              ),

            ],

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

            onPressed: (){

              AppCubit.get(context).updateData(

                status: 'done',

                id: modle['id'],

              );

            },

            icon: Icon(

              Icons.check_box,

              color: Colors.green,

            ),),

        IconButton(

          onPressed: (){

            AppCubit.get(context).updateData(

              status: 'archived',

              id: modle['id'],

            );

          },

          icon: Icon(

            Icons.archive,

            color: Colors.black45,

          ),),

      ],





    ),

  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteData( id: modle['id'],);
  },
) ;
Widget BuildArticaleItem(article ,context)=>InkWell(
    onTap: (){
       navigateTo(context, WebViewScreen(article['url']),);
    },
    child:Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          height: 120.0,
  
          width: 120.0,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0,),
  
            image: DecorationImage(
  
              image: NetworkImage('${article['urlToImage']}'),
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child:Container(
  
            height: 120.0,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    '${article['title']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 4,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  '${article['publishedAt']}',
  
                  style: TextStyle(
  
                    color: Colors.grey,
  
                  ),
  
                ),
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);
void navigateTo(context, widget )=> Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>widget,
    ),
  );
void navigationAndFinish(context, widget)=>Navigator.pushAndRemoveUntil(
  context,
    MaterialPageRoute(
      builder: (context)=>widget,
    ),
     (route) => false,
);
Widget defaultFormField(controller)=>TextFormField(
controller:controller,
keyboardType: TextInputType.visiblePassword,
validator: (String? value){
if(value!.isEmpty){
return 'please enter your password';
}
},
decoration:InputDecoration(
prefixIcon:Icon(Icons.password_rounded),
labelText:'Password' ,
focusedBorder: OutlineInputBorder(

),
),
);
Widget defaultButtom()=>Container(
  width: double.infinity,
  color: Colors.blue,
  child: MaterialButton (onPressed: (){

  },
    child: Text(
      'Login',
      style: TextStyle(
        color: Colors.white,

      ),

    ),
  ),
);
void signOut(){}
//   TextButton(
//     onPressed: (){
//       CacheHelper.removedata(key: 'token',).then((value) {
//         if(value){
//           navigationAndFinish(context, ShopLoginScreen(),);
//         }
//       });
//     },
//     child: Text('Sign Out'),
//   );
// }