import 'package:flutter/material.dart';
class userModel{
  final int id;
  final String name;
  final String phone;
  userModel({
    required this.id,
    required this.name,
    required this.phone,
});
}
class UserScreen extends StatelessWidget {

  List<userModel> users =[
    userModel(
      id: 1,
        name: 'mohamed memo',
        phone: '+0201156789',
    ),
    userModel(
      id: 1,
      name: 'mohamed Abdelsalam',
      phone: '+0201156789',
    ),
    userModel(
      id: 1,
      name: 'mohamed abdelrhman',
      phone: '+0201156789',
    ),
    userModel(
      id: 1,
      name: 'mohamed abdoo',
      phone: '+0201156789',
    ),
    userModel(
      id: 1,
      name: 'mohamed eslam',
      phone: '+0201156789',
    ),
    userModel(
      id: 1,
      name: 'mohamed Abdelsalam',
      phone: '+0201156789',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body:ListView.separated(
          itemBuilder: (context , index) =>buildUserItem(users[index]),
          separatorBuilder: (context , index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: users.length,
      )
    );
  }
  Widget buildUserItem([userModel? user]) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user!.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey ,
              ),

            ),

          ],
        )
      ],
    ),
  );
}
