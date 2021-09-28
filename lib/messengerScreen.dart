import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0 ,
              backgroundImage: NetworkImage('https://www.investnational.com.au/wp-content/uploads/2016/08/person-stock-2.png'),
            ),
            SizedBox(
              width: (
                  15.0
              ),
            ),
            Text (
              'chats',
                  style: TextStyle(
                    color: Colors.black,
                  ),
            ),


          ],

        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              ),

          ),
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),

          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded),
                    Text('search'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) => buildStoryItem(),
                    separatorBuilder: (context,index) => SizedBox(
                      width: 20.0,
                    ),
                    itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index)=>buildChatItem() ,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 15,
              ),





            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0 ,
            backgroundImage: NetworkImage('https://www.investnational.com.au/wp-content/uploads/2016/08/person-stock-2.png'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0 ,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('mohamed Abdelsalam',
              style:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text('hello my name is mohamed Abdelsalam',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 7.0 ,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text('2:00 pm'),

              ],
            )
          ],
        ),
      )

    ],
  );
  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(

      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0 ,
              backgroundImage: NetworkImage('https://www.investnational.com.au/wp-content/uploads/2016/08/person-stock-2.png'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0 ,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),

        Text(
          'mohamed Abdelsalm',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],


    ),

  );
}
