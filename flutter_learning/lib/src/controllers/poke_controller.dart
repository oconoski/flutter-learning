import 'package:flutter/widgets.dart';
import 'package:flutter_learning/src/data/models/poke_model.dart';
import 'package:flutter_learning/src/data/repository/poke_repository.dart';
import 'package:get/get.dart';

class PokeController extends GetxController {
  final PokeRepository repository;
  PokeController(this.repository);

  final name = TextEditingController();
  final image = TextEditingController();

  var loading = true.obs;
  var pokemons = [];

  var message = ''.obs;

  GlobalKey<FormState> pokeForm = GlobalKey<FormState>();

  @override
  void onReady() async {
    await pokemonGet();
    super.onReady();
  }

  pokemonGet() async {
    await repository.get().then((data) {
      pokemons = data;
    }, onError: (e) {});
  }

  pokemonCreatePage() async {
    Get.offAllNamed('/pokemon_create');
  }

  submit() async {
    await repository.store(Poke(
      name: name.text,
      image: image.text,
    ));
    Get.offAllNamed('my_own_dex');
  }
}
