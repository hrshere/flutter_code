import 'package:flutter/material.dart';

import 'package:listview_navigation_api/screens/first_screen.dart';
import 'package:listview_navigation_api/screens/second_screen.dart';

void main()=> runApp(const ListviewApp());

class ListviewApp extends StatefulWidget {
  const ListviewApp({Key? key}) : super(key: key);

  @override
  State<ListviewApp> createState() => _ListviewAppState();
}

class _ListviewAppState extends State<ListviewApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        '/second':(context) => const SecondScreen(),
      },

      home: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text("Listview App"),
          actions: [
            PopupMenuButton(itemBuilder: (context)=>[
              const PopupMenuItem(value:1,child: Icon(Icons.settings,color: Colors.red,)),
              const PopupMenuItem(value:1,child: Icon(Icons.logout,color: Colors.red,))
            ])
          ],
        ),


        body: const FirstScreen(),
      ),
    );
  }
}




