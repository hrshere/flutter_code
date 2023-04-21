import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _data= [];

  void _loadCSV() async{
    final _rawData = await rootBundle.loadString("assets/b.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("display csv file"),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), onPressed: _loadCSV,
      ),

      body: ListView.builder(itemCount: _data.length,
      itemBuilder: (_,index){
        return Card(
          margin: const EdgeInsets.all(3),
          color: index==0 ? Colors.amber: Colors.white,
          child: ListTile(
            leading: Text(_data[index][0].toString()),
            title: Text(_data[index][1].toString()),
            trailing: Text(_data[index][2].toString()),
          ),
        );
      },
      ),
    );
  }
}

