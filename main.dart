import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Screens/display_screen.dart';

import 'package:untitled2/Screens/form_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> FormScreen()),
        GetPage(name: '/display', page: ()=> DisplayScreen())
      ],
      debugShowCheckedModeBanner: false,
      home: FormScreen(),
    );
  }
}
