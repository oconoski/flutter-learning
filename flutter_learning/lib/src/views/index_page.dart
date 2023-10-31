import 'package:flutter/material.dart';
import 'package:flutter_learning/src/controllers/user_controller.dart';
import 'package:flutter_learning/src/data/providers/user_provider.dart';
import 'package:flutter_learning/src/data/repository/user_repository.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<UserController> {
  final userController =
      Get.put(UserController(UserRepository(UserProvider())));

  bool morePressed = true;
  bool removeItens = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OWNDEX',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(34, 34, 36, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                color: const Color.fromRGBO(240, 0, 0, 1),
                child: const Center(
                    child: Text(
                  'MINHA POKEDEX',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
              onTap: () => Get.offAllNamed(
                controller.isLogged ? 'my_own_dex' : 'login',
              ),
            ),
          ),
          Container(
            color: const Color.fromRGBO(34, 34, 36, 1),
            height: 30.0,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: InkWell(
            child: Container(
              color: const Color.fromRGBO(240, 240, 240, 1),
              child: const Center(
                child: Text('POKEDEX',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            onTap: () => Get.toNamed(
              'pokedex_list',
            ),
          )),
        ],
      ),
    );
  }
}
