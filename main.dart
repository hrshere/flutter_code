

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_implement_sharedpref/screens/home_screen.dart';
import 'package:login_implement_sharedpref/screens/login_screen.dart';
import 'package:login_implement_sharedpref/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MainApp(),
          // '/splash':(context) => const SplashApp(),
          '/login': (context) => LoginApp(),
          '/home': (context) => const HomeApp()
        },
      )
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  static const String KEYLOGIN = "login";
  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    WhereToGo();



  }

  @override
  Widget build(BuildContext context) {
    return

       Scaffold(
        appBar: AppBar(
          title: Text('my splash screen'),
        ),

    );
  }

  void WhereToGo() async {
    var sharedpref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedpref.getBool(KEYLOGIN);

    Timer(
        Duration(seconds: 5),
            () {
          if(isLoggedIn!=null){
            if(isLoggedIn){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeApp()));
            }
            else{
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginApp()));
            }
          }else

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginApp()));
        } );

  }
}
