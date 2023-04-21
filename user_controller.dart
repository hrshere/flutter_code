import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/user_controller.dart';
import 'package:untitled2/Models/user_data.dart';

class UserController extends GetxController{
// static TextEditingController nameController = TextEditingController();
// static TextEditingController branchController = TextEditingController();
// static TextEditingController techController = TextEditingController();

// AddTo(){
//   final user = User();
//   user.name = nameController.toString();
//   user.branch = branchController.toString();
//   user.tech = techController.toString();
//
// }

  final nameController = TextEditingController();
  final branchController = TextEditingController();
  final techController = TextEditingController();

  RxString controllerName = ''.obs;
  RxString controllerBranch = ''.obs;
  RxString controllerTech = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(() {
      controllerName.value = nameController.text;
    },);
      branchController.addListener(() {
        controllerBranch.value = branchController.text;
      });
      techController.addListener(() {
        controllerTech.value = techController.text;
      });
  }

}