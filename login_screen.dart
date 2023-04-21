import 'package:flutter/material.dart';
import 'package:login_implement_sharedpref/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:login_implement_sharedpref/main.dart';

void main()=> runApp(LoginApp());

class LoginApp extends StatelessWidget {
  LoginApp({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your Name',

              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter Password',

              ),
                obscureText: true
            ),
            ElevatedButton(

                onPressed:()async{
                  var sharedPref =await SharedPreferences.getInstance();
                  sharedPref.setBool(MainAppState.KEYLOGIN, true);
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeApp()));},
                child:const Text('Submit'))

          ],
        )),
      );
  }
}
