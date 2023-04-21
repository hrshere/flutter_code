import 'package:flutter/material.dart';

void main() => runApp( const LabelTextApp());

class LabelTextApp extends StatefulWidget {
  const LabelTextApp({Key? key}) : super(key: key);

  @override
  State<LabelTextApp> createState() => _LabelTextAppState();
}

class _LabelTextAppState extends State<LabelTextApp> {
  // final nameTextEditingController = TextEditingController();



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(

        appBar: AppBar(
          title: const Text("Text on Label App"),
        ),

        body: Column(

          children: [

             // Text("Welcome ${nameTextEditingController.text}",style: TextStyle(fontSize: 30),),

            TextField(
              // controller: nameTextEditingController,
              onChanged: (text) {
                print('First text field: $text');
              },
            ),

            ElevatedButton(
                onPressed:() => {
                  setState((){

                  })
                },
                child: const Text("Print Text"),
            )
          ],
        ),
      )
    );
  }
}
