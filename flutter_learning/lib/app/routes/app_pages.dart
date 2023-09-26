import 'package:flutter_learning/app/routes/app_routes.dart';
import 'package:flutter_learning/pages/bindings/home_page_binding.dart';
import 'package:flutter_learning/pages/pages/details.dart';
import 'package:flutter_learning/pages/pages/home.page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => Details(),
      // binding: HomeBinding()
    )
  ];
}
