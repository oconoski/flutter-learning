import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_learning/src/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokedexRepository extends ChangeNotifier {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon/';
  final String githubImageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';

  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  Future<void> fetchRandomPokemons(int count) async {
    final List<Pokemon> randomPokemons = [];

    for (int i = 0; i < count; i++) {
      final int randomId = (1 + (DateTime.now().millisecondsSinceEpoch % 800));
      print(randomId);
      final response = await http.get(Uri.parse('$apiUrl$randomId'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final pokemon = Pokemon(
          id: jsonData['id'],
          name: jsonData['name'],
          imageUrl: '$githubImageUrl${jsonData['id']}.png',
        );
        randomPokemons.add(pokemon);
      }
    }

    _pokemons = randomPokemons;
    notifyListeners();
  }

  void toggleFavorite(int id) {
    final index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    if (index != -1) {
      _pokemons[index].isFavorite = !_pokemons[index].isFavorite;
      notifyListeners();
    }
  }

  void removePokemon(int id) {
    final index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    if (index != -1) {
      _pokemons.removeAt(index);
      notifyListeners();
    }
  }
}
