import 'package:flutter/material.dart';
import 'package:flutter_learning/app/routes/app_pages.dart';
import 'package:flutter_learning/app/routes/app_routes.dart';
import 'package:flutter_learning/src/db/user_service.dart';
import 'package:get/get.dart';
import 'package:flutter_learning/src/data/repository/pokedex_repository.dart';
import 'package:provider/provider.dart'; // Import Provider

Future<void> main() async {
  await inicialization();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PokedexRepository()), // Add this provider
      ],
      child: GetMaterialApp(
        title: 'OWNDEX',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.INDEX,
        getPages: AppPages.routes,
      ),
    ),
  );
}

Future inicialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => UserService().init());
}
