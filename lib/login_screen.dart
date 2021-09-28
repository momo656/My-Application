import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

 var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                style: TextStyle(
                fontSize: 40.0,
               fontWeight: FontWeight.bold,
            ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email
                    ),

                  ),

                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,

                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                        Icons.lock,
                    ),
                    suffixIcon: Icon(
                        Icons.remove_red_eye,
                    ),

                  ),

                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton (onPressed: (){
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  child: Text(
                    'Login',
                        style: TextStyle(
                          color: Colors.white,

                  ),

                  ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "don't have account?"
                    ),
                    TextButton(onPressed: (){}, child: Text(
                      'Resister Now'

                    ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
