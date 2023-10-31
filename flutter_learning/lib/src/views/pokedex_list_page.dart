import 'package:flutter/material.dart';
import 'package:flutter_learning/src/widgets/ActionButtonCustom.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learning/src/data/repository/pokedex_repository.dart';

class PokedexListPage extends StatefulWidget {
  const PokedexListPage({Key? key}) : super(key: key);

  @override
  State<PokedexListPage> createState() => _PokedexListPageState();
}

class _PokedexListPageState extends State<PokedexListPage> {
  bool removeItems = false;

  @override
  void initState() {
    super.initState();
    // Fetch random Pokémon data when the widget is initialized
    final pokedexRepository =
        Provider.of<PokedexRepository>(context, listen: false);
    pokedexRepository.fetchRandomPokemons(5);
  }

  @override
  Widget build(BuildContext context) {
    final pokedexRepository = Provider.of<PokedexRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POKEDEX',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.toNamed('index'),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(30, 30, 30, 0.8),
        actions: [
          IconButton(
            icon: removeItems
                ? const Icon(Icons.check)
                : const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                removeItems = !removeItems;
              });
            },
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(30),
        crossAxisCount: 1,
        mainAxisSpacing: 50,
        children: pokedexRepository.pokemons.map((pokemon) {
          return GestureDetector(
            onTap: () => Get.toNamed('details'),
            child: Dismissible(
              key: UniqueKey(),
              background:
                  Container(color: const Color.fromARGB(0, 244, 67, 54)),
              onDismissed: (direction) {
                pokedexRepository.removePokemon(pokemon.id);
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: Center(
                      child: Image.network(
                        pokemon.imageUrl,
                        fit: BoxFit.cover,
                        width: 350, // Adjust the width as needed
                        height: 350, // Adjust the height as needed
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
                  removeItems
                      ? Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 200, 15, 1),
                                ),
                                onPressed: () {
                                  pokedexRepository.removePokemon(pokemon.id);
                                },
                              ),
                            ),
                          ),
                        )
                      : Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: IconButton(
                              icon: Icon(
                                pokemon.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed: () {
                                pokedexRepository.toggleFavorite(pokemon.id);
                              },
                              color: const Color.fromARGB(255, 200, 15, 1),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      backgroundColor: const Color.fromRGBO(130, 130, 130, 0.8),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ActionButtonCustom(),
    );
  }
}
