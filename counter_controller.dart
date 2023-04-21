import 'package:get/get.dart';

class Controller extends GetxController{
  static var count = 0.obs;
  increment()=> count++;
}