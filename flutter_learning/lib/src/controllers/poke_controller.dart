import 'package:flutter/widgets.dart';
import 'package:flutter_learning/src/data/models/poke_model.dart';
import 'package:flutter_learning/src/data/repository/poke_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class PokeController extends GetxController {
  final PokeRepository repository;
  PokeController(this.repository);

  final ImagePicker picker = ImagePicker();

  Rxn<String> myphoto = Rxn<String>();

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
    myphoto.value = '';
  }

  Future<List<Poke>> pokemonGet() async {
    final data = await repository.get();
    pokemons = data;
    return data;
  }

  prepareCameras() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera, imageQuality: 10);

    if (photo != null) {
      var take = photo.path.toString();

      File imageFile = File(take.toString());
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      myphoto.value = base64Image;
    }
  }

  pokemonCreatePage() async {
    Get.offAllNamed('/pokemon_create');
  }

  submit() async {
    var validate = pokeForm.currentState!.validate();
    var blob = myphoto.value.toString();

    if (validate) {
      await repository.store(Poke(
        name: name.text,
        image: blob,
      ));
      Get.offAllNamed('my_own_dex');
    }
  }

  photoExists() {
    return myphoto.value?.isNotEmpty;
  }
}
