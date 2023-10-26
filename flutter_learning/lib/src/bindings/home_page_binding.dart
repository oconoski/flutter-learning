import 'package:get/get.dart';
import 'package:flutter_learning/src/controllers/routing_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
