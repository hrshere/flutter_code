import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:persistence/models/dog.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

const String dogsTable = 'Dog';

class DogDatabase {
  static late Database database;

  // WidgetsFlutterBinding.ensureInitialized();
  static Future<void> Createdb() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE dogs(id Text PRIMARY KEY, name Text, age Text)',
        );
      },
      version: 1,
    ) as Database;
  }

  static Future<void> insertDog(Dog dog) async {
    final db = await database;

    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // var fido = const Dog(id: 0, name: 'Fido', age: 35);
  //
  // await insertDog(fido);

  static Future<List<Dog>> dogs() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(maps.length, (i) {
      return Dog(id: maps[i]['id'], name: maps[i]['name'], age: maps[i]['age']);
    });
  }
}
