import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/Screens/other_screen.dart';
import 'package:getx_learning/business_logic/counter_controller.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(GetMaterialApp(
  // theme: Get.changeTheme(ThemeData.dark()),
    home: MyApp()
));

class MyApp extends StatelessWidget {
  final Controller c = Get.put(Controller());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            children: [
              const DrawerHeader(child: Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey,
          child: const Text('+1'),
        ),
        label: const Text('Counter'),
      ),
              decoration: BoxDecoration(
                color: Colors.greenAccent
              ),
              ),

              ListTile(
                title:   ElevatedButton(onPressed:(){
                  Get.snackbar("This is a counter App", "Made with the help of Getx"
                      ,icon: Icon(Icons.countertops),
                      snackPosition: SnackPosition.TOP
                  );

                },
                    child: Text('Show SnackBar')),
              ),
              ListTile(
                title:  ElevatedButton(onPressed:(){
                  Get.changeTheme(Get.isDarkMode?ThemeData.light():ThemeData.dark());
                }, child: Text('change Theme')),
              ),
              ListTile(
                title: ElevatedButton(
                  onPressed:()=> Get.to(Other()),
                  child: Text('goto other screen'),
                )
              )
            ],
        ),
      ),

        appBar: AppBar(
          title: Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: const Text('+1'),
            ),
            label: const Text('Counter'),
          ),
          centerTitle: true,

        ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1611957082126-061f655ef1fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y291bnRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 50,
              color: Colors.transparent.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: SizedBox(height: 200,
                  width: double.infinity
                  ,child: Obx(()=>Center(
                    child: Text("Count : ${Controller.count}",
                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.greenAccent,fontSize: 35))
                    )
                    ),
                  ))),


            ElevatedButton(onPressed:(){
              Get.snackbar("This is a counter App", "Made with the help of Getx"
              ,icon: Icon(Icons.countertops),
                snackPosition: SnackPosition.TOP
              );

            },
                child: Text('Show SnackBar')),

            ElevatedButton(onPressed:(){
              Get.changeTheme(Get.isDarkMode?ThemeData.light():ThemeData.dark());
            }, child: Text('change Theme')),
            Center(child: ElevatedButton(
              onPressed:()=> Get.to(Other()),
              child: Text('goto other screen'),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: c.increment)

    );
  }
}


