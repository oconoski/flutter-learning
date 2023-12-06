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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
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
            onPressed: () => Get.toNamed('index'),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(30, 30, 30, 0.8),
        ),
        body: FutureBuilder<List<Poke>>(
          future: pokeController.pokemonGet(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar os dados');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum Pokémon encontrado'));
            } else {
              return GridView.count(
                padding: const EdgeInsets.all(30),
                crossAxisCount: 1,
                mainAxisSpacing: 50,
                children: snapshot.data!.map((pokemon) {
                  return GestureDetector(
                    child: Dismissible(
                      key: UniqueKey(),
                      background: Container(color: const Color.fromARGB(0, 244, 67, 54)),
                      onDismissed: (direction) {
                        // pokeController.removePokemon(pokemon.id);
                      },
                      child: GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(255, 255, 255, 0.7),
                              ),
                              child: Center(
                                child: pokemon.image.isNotEmpty
                                    ? Image.network(
                                        "pokemon.image",
                                        fit: BoxFit.cover,
                                        width: 350,
                                        height: 350,
                                      )
                                    : Container(
                                        width: 350.0,
                                        height: 350.0,
                                        color: Colors.grey,
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
                                    pokemon.name.toUpperCase(),
                                    style: const TextStyle(
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
                                  icon: const Icon(
                                    Icons.favorite_border,
                                  ),
                                  onPressed: () {
                                    // pokeController.toggleFavorite(pokemon.id);
                                  },
                                  color: const Color.fromARGB(255, 200, 15, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
        backgroundColor: const Color.fromRGBO(130, 130, 130, 0.8),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: ActionButtonCustom(),
      ),
    );
  }
}
