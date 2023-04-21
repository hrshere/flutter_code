import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/business_logic/counter_controller.dart';

class Other extends StatelessWidget {

  final Controller c = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(()=>Text("clicks: ${Controller.count}")),
      ),
      body: Center(child: Text(Controller.count.toString()),),
    );
  }
}
