import 'package:flutter/material.dart';
import 'package:login_implement_sharedpref/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_implement_sharedpref/main.dart';

void main()=> runApp(const HomeApp());

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(child: Column(
            children: [Text('$args'),
              ElevatedButton(onPressed:() async{
                var sharedPref =await SharedPreferences.getInstance();
                sharedPref.setBool(MainAppState.KEYLOGIN, false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginApp()));
              },
                  child: Text('Logout'))

        ]
        )
        ),

    );
  }
}
