import 'package:flutter/material.dart';
import 'package:flutter_learning/src/controllers/user_controller.dart';
import 'package:flutter_learning/src/data/providers/user_provider.dart';
import 'package:flutter_learning/src/data/repository/user_repository.dart';
import 'package:get/get.dart';

class UserCreatePage extends GetView<UserController> {
  final userController = Get.put(UserController(UserRepository(UserProvider())));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(34, 34, 36, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.toNamed(
              'login',
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
                        key: userController.registerForm,
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                "Crie sua conta na OWNDEX e adicione seus próprios pokemons!",
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
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: userController.fullname,
                                  validator: (value) {
                                    if (value == null || value == '' || value.isEmpty) {
                                      return 'Insira seu nome';
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: 'Nome',
                                    hintStyle: const TextStyle(color: Colors.white),
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
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: userController.username,
                                  validator: (value) {
                                    if (value == null || value == '' || value.isEmpty) {
                                      return 'Insira um usuário';
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: 'Usuário',
                                    hintStyle: const TextStyle(color: Colors.white),
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
                                      Icons.person,
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
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Obx(
                                  () => TextFormField(
                                    controller: userController.password,
                                    validator: (value) {
                                      if (value == null || value == '' || value.isEmpty) {
                                        return 'Insira uma senha';
                                      }
                                      if (value.length < 6) {
                                        return 'A senha precisa ter no mínimo 6 caracteres';
                                      }
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !controller.visiblePassword.value,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      hintText: 'Senha',
                                      hintStyle: const TextStyle(color: Colors.white),
                                      filled: true,
                                      fillColor: Colors.grey,
                                      labelStyle: const TextStyle(
                                        color: Colors.white,
                                      ),
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
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        weight: 600,
                                        size: 20,
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          controller.visiblePassword.value = !controller.visiblePassword.value;
                                        },
                                        child: Icon(
                                          !controller.visiblePassword.isTrue ? Icons.remove_red_eye_outlined : Icons.remove_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      errorStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => userController.message.isNotEmpty
                          ? Text(
                              userController.message.value,
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
                            userController.register();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(68, 70, 85, 1),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 30.0,
                            ),
                          ),
                          child: userController.loading.isTrue ? const Text('Cadastrar') : const Text('carregando'),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      InkWell(
                        onTap: () => {
                          Get.toNamed(
                            'login',
                          ),
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Já possui cadastro? ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
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
