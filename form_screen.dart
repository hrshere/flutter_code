import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Models/user_data.dart';
import 'package:untitled2/Screens/display_screen.dart';
import 'package:untitled2/Controllers/user_controller.dart';

class FormScreen extends StatelessWidget {
  FormScreen({Key? key}) : super(key: key);
  static const id = '/page1';
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1524055988636-436cfa46e59e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1lbWJlcnNoaXAlMjBmb3JtJTIwYmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
              fit: BoxFit.cover)),
      child: SizedBox(
        height: 100,
        child: Card(
          color: Colors.transparent,
          elevation: 100,
          margin: const EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                    label: const Text('Name'),
                    hintText: 'John',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.techController,
                decoration: InputDecoration(
                    label: const Text('Tech.'),
                    hintText: 'eg. Mobile App Dev.',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.branchController,
                decoration: InputDecoration(
                    label: const Text('Branch'),
                    hintText: 'eg. CSE',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/display');
                    Get.snackbar("ThankYou", "Your Details has been added",
                        icon: const Icon(Icons.countertops),
                        snackPosition: SnackPosition.TOP,
                        colorText: Colors.greenAccent);
                    // Get.put(User(name: UserController.nameController.text,branch: UserController.branchController.text,tech: UserController.techController.text));
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
