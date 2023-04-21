import 'package:flutter/material.dart';
import 'package:persistence/models/dog.dart';
import 'package:persistence/databases/dog_database.dart';


class EntryApp extends StatefulWidget {
  const EntryApp({Key? key}) : super(key: key);

  @override
  State<EntryApp> createState() => _EntryAppState();
}

class _EntryAppState extends State<EntryApp> {
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add a new Dog"),
        ),
        body:SingleChildScrollView(child:Container(

          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsn-bwiqDU8e8w-3doiq78aGmgIaNefOzjbQ&usqp=CAU"),

                  )
          ),
          
          child:
            Form(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 450),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      // SizedBox(height: 100,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: idController,
                          decoration: const InputDecoration(
                            labelText: 'enter id',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(

                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Dog Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.pets),
                          ),
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: TextFormField(
                          controller: ageController,
                          decoration: const InputDecoration(
                            labelText: 'Age',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.numbers),
                          ),
                      ),
                       ),

                      ElevatedButton(onPressed:()async{
                       getdogdetail();
                      },
                          child: const Text('Add'))

                    ],



            ),
                ),
              ),
          ),

        ),)
      ),
    );
  }

  void getdogdetail() {
    var data = Dog(id:idController.text,name: nameController.text, age: ageController.text);
    print(data);
    DogDatabase.insertDog(data);
  }
}
