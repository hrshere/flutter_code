import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_implement_sharedpref/screens/login_screen.dart';

void main()=> runApp(const SplashApp());

class SplashApp extends  StatefulWidget {
  const SplashApp({Key? key}) : super(key: key);

  @override
  State<SplashApp> createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), (){
       Navigator.pushReplacement(context,
           '/login' as Route<Object?>);
     },
     );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(

          body: Center(child: Text('my splash screen')),
        ),
    );
  }
}
