

import 'package:flutter/material.dart';
import 'package:persistence/databases/dog_database.dart';
import 'package:persistence/screens/details_entry.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DogDatabase.Createdb();

  runApp(const MyDogApp());
}

class MyDogApp extends StatelessWidget {
  const MyDogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: EntryApp(),
      ),
    );
  }
}

