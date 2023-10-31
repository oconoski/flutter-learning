import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  detail() {
    Get.toNamed(
      'details',
    );
  }

  index() {
    Get.toNamed(
      'index',
    );
  }

  pokedexListPage() async {
    Get.offAllNamed('/pokedex_list');
  }

  login() async {
    Get.offAllNamed('/login');
  }
}
