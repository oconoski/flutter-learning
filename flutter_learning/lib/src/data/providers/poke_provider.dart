import 'package:flutter_learning/src/data/models/poke_model.dart';
import 'package:flutter_learning/src/db/poke_service.dart';
import 'package:get/get.dart';

class PokeProvider {
  final pokeService = Get.find<PokeService>();

  Future<List<Poke>> get() async {
    return await pokeService.get();
  }

  Future<Poke> store(Poke poke) async {
    return await pokeService.store(poke);
  }

  Future<Poke> update(Poke poke) async {
    return await pokeService.update(poke);
  }

  Future<int> delete(int id) async {
    return await pokeService.delete(id);
  }
}
