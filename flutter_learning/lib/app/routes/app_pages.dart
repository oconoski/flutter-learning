import 'package:flutter_learning/app/routes/app_routes.dart';
import 'package:flutter_learning/src/bindings/home_page_binding.dart';
import 'package:flutter_learning/src/views/details_page.dart';
import 'package:flutter_learning/src/views/index_page.dart';
import 'package:flutter_learning/src/views/login_page.dart';
import 'package:flutter_learning/src/views/my_own_dex_list_page.dart';
import 'package:flutter_learning/src/views/poke_create_page.dart';
import 'package:flutter_learning/src/views/pokedex_list_page.dart';
import 'package:flutter_learning/src/views/user_create_page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INDEX,
      page: () => IndexPage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      // binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.USER_CREATE,
      page: () => UserCreatePage(),
      // binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.POKE_CREATE,
      page: () => PokeCreatePage(),
      // binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.MY_OWN_DEX,
      page: () => MyOwnDexPage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsPage(),
      // binding: HomeBinding()
    ),
    GetPage(
      name: Routes.POKEDEX_LIST,
      page: () => const PokedexListPage(),
      // binding: HomeBinding()
    )
  ];
}
