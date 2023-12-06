import 'package:flutter/material.dart';
import 'package:flutter_learning/src/controllers/poke_controller.dart';
import 'package:flutter_learning/src/data/providers/poke_provider.dart';
import 'package:flutter_learning/src/data/repository/poke_repository.dart';
import 'package:get/get.dart';
import 'dart:convert';

class PokeCreatePage extends GetView<PokeController> {
  final pokeController =
      Get.put(PokeController(PokeRepository(PokeProvider())));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(34, 34, 36, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.toNamed(
              'my_own_dex',
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromRGBO(34, 34, 36, 1),
          child: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Form(
                        key: pokeController.pokeForm,
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                "Cadastro de pokemon!",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              InkWell(
                                onTap: () => {pokeController.prepareCameras()},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(00.0),
                                  child: Obx(
                                    () => SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Visibility(
                                            visible:
                                                pokeController.myphoto.value !=
                                                    '',
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.green,
                                                image: DecorationImage(
                                                  image: MemoryImage(
                                                      base64Decode(
                                                          pokeController
                                                              .myphoto.value!)),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                pokeController.myphoto.value ==
                                                    '',
                                            child: pokeController.photoExists()
                                                ? Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${pokeController.myphoto.value}"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 350.0,
                                                    height: 350.0,
                                                    color: Colors.grey,
                                                    child: const Center(
                                                        child:
                                                            Icon(Icons.camera)),
                                                  ),
                                          ),
                                          Visibility(
                                            visible:
                                                pokeController.myphoto.value ==
                                                    '',
                                            child: const Text(
                                              "(Imagem opcional)",
                                              style: TextStyle(
                                                color: Colors.white,
                                                // Add any additional styling properties as needed
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: pokeController.name,
                                  validator: (value) {
                                    if (value == null ||
                                        value == '' ||
                                        value.isEmpty) {
                                      return 'Nome';
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: 'Nome',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    filled: true,
                                    focusColor: Colors.white,
                                    fillColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.abc,
                                      color: Colors.white,
                                      weight: 600,
                                      size: 20,
                                    ),
                                    errorStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() => pokeController.message.isNotEmpty
                          ? Text(
                              pokeController.message.value,
                              style: const TextStyle(
                                color: Color.fromRGBO(
                                  255,
                                  10,
                                  10,
                                  1,
                                ),
                              ),
                            )
                          : const Text('')),
                      const SizedBox(
                        height: 25,
                      ),
                      Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            pokeController.submit();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(68, 70, 85, 1),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 30.0,
                            ),
                          ),
                          child: pokeController.loading.isTrue
                              ? const Text('Cadastrar')
                              : const Text('carregando'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
