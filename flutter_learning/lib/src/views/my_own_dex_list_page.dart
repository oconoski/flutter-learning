import 'package:flutter/material.dart';
import 'package:flutter_learning/src/controllers/poke_controller.dart';
import 'package:flutter_learning/src/controllers/user_controller.dart';
import 'package:flutter_learning/src/data/models/poke_model.dart';
import 'package:flutter_learning/src/data/providers/poke_provider.dart';
import 'package:flutter_learning/src/data/providers/user_provider.dart';
import 'package:flutter_learning/src/data/repository/poke_repository.dart';
import 'package:flutter_learning/src/data/repository/user_repository.dart';
import 'package:flutter_learning/src/widgets/ActionButtonCustom.dart';
import 'package:get/get.dart';

class MyOwnDexPage extends GetView<PokeController> {
  final pokeController = Get.put(PokeController(PokeRepository(PokeProvider())));
  final userController = Get.put(UserController(UserRepository(UserProvider())));

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
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String choice) {
                if (choice == 'Sair') {
                  userController.unsetSession();
                } else if (choice == 'Conta') {}
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Conta',
                    child: Text('Conta'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Sair',
                    child: Text('Sair'),
                  ),
                ];
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.toNamed(
              'index',
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(30, 30, 30, 0.8),
        ),
        body: ListView.builder(
          itemCount: pokeController.pokemons.length,
          itemBuilder: (context, index) {
            final Poke pokemon = pokeController.pokemons[index];

            return InkWell(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: Center(
                      child: Image.asset(
                        pokemon.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          pokemon.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 200, 15, 1),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Implemente a lógica desejada quando um Pokémon for tocado
                // Exemplo: Get.toNamed('details', arguments: pokemon);
              },
            );
          },
        ),
        backgroundColor: const Color.fromRGBO(130, 130, 130, 0.8),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: ActionButtonCustom());
  }
}
