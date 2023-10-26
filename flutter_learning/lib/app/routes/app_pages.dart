import 'package:flutter_learning/app/routes/app_routes.dart';
import 'package:flutter_learning/src/bindings/home_page_binding.dart';
import 'package:flutter_learning/src/views/details_page.dart';
import 'package:flutter_learning/src/views/index_page.dart';
import 'package:flutter_learning/src/views/pokedex_list_page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INDEX,
      page: () => const IndexPage(),
      binding: HomePageBinding(),
    ),
    // GetPage(
    // name: Routes.MYOWNDEX,
    // page: () => MyOwnDexPage(),
    // binding: HomePageBinding(),
    // ),
    GetPage(
      name: Routes.DETAILS,
      page: () => Details(),
      // binding: HomeBinding()
    ),
    GetPage(
      name: Routes.POKEDEX_LIST,
      page: () => const PokedexListPage(),
      // binding: HomeBinding()
    )
  ];
}
