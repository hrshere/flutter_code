import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/user_controller.dart';
import 'package:untitled2/Models/user_data.dart';

class DisplayScreen extends StatelessWidget {
  DisplayScreen({Key? key}) : super(key: key);
  final controller = Get.find<UserController>();

  List<User> items = <User>[].obs;

  void AddToList() {
    items.addNonNull(User(
        name: controller.nameController.text,
        tech: controller.techController.text,
        branch: controller.branchController.text));
    print(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());}, icon: Icon(Icons.dark_mode))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('hi')),
            ListTile(
              title:Text('Add User'),
              onTap:()=>  Get.defaultDialog(content: DecoratedBox(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1524055988636-436cfa46e59e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1lbWJlcnNoaXAlMjBmb3JtJTIwYmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                        fit: BoxFit.cover)),
                child: SizedBox(
                  height: 500,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 100,
                    margin: const EdgeInsets.all(10),
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
              ),
            ))
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      AddToList();

                    },
                    child: const Text('Refresh')),
              ),
              ElevatedButton(onPressed:(){
                Get.defaultDialog(content: DecoratedBox(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1524055988636-436cfa46e59e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1lbWJlcnNoaXAlMjBmb3JtJTIwYmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                          fit: BoxFit.cover)),
                  child: SizedBox(
                    height: 500,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 100,
                      margin: const EdgeInsets.all(10),
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
                ),);
              }, child: Text('Add User Profile'))
            ],
          ),
          Obx(
          ()=> Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 300,
                      child: Card(
                          margin:
                              const EdgeInsets.only(right: 30, left: 30, top: 10,bottom: 10),
                          color: Colors.white70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${items[index].name}',
                                style: const TextStyle(fontSize: 30),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Text(
                                      '${items[index].tech} || ${items[index].branch}'))
                            ],
                          )),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
