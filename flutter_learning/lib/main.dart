import 'package:flutter/material.dart';
import 'package:flutter_learning/app/routes/app_pages.dart';
import 'package:flutter_learning/app/routes/app_routes.dart';
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

Future inicialization() async {}
