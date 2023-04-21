import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:listview_navigation_api/modal_class/modal_class_one.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
String ap='Approve?';
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Photo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Screen'),
      ),
      body: Center(child:
          Column(
            children: [ListTile(
              leading: const Text('id'),
              trailing: Text(args.id.toString()),
            ),

              ListTile(
                leading: const Text('UserId'),
                trailing: Text(args.albumId.toString()),
              ),
              ListTile(
                leading: const Text('image'),
                trailing: GestureDetector(child: Image.network(args.thumbnailUrl,),
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Your Image'),
                      content: Image.network(args.thumbnailUrl),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Text('URL'),
                trailing: GestureDetector(
                    child: Text(args.url),
                  onTap: () =>{
                      Uri.parse(args.url)
                  },
                ),
              ),
              ListTile(
                leading: const Text('Title'),
                title:Text(args.title,style: const TextStyle(fontSize: 10),),
              )
      ]
          )
      ),

      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {
          setState(() {
            bool isClick = false;
            if(isClick==false){
              ap = 'approved!!';
            }

          });

        },
        label: Text('$ap'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
