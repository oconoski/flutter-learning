import 'package:flutter/material.dart';
import 'package:flutter_learning/app/routes/app_pages.dart';
import 'package:flutter_learning/app/routes/app_routes.dart';
import 'package:flutter_learning/src/db/poke_service.dart';
import 'package:flutter_learning/src/db/user_service.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await inicialization();

  runApp(GetMaterialApp(
    title: 'OWNDEX',
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INDEX,
    getPages: AppPages.routes,
  ));
}

Future inicialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeUserService();

  await _initializePokeService();
}

Future<void> _initializeUserService() async {
  await Get.putAsync(() => UserService().init());
}

Future<void> _initializePokeService() async {
  await Get.putAsync(() => PokeService().init());
}
