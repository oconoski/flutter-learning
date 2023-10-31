import 'package:flutter/widgets.dart';
import 'package:flutter_learning/src/data/models/user_model.dart';
import 'package:flutter_learning/src/data/repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository repository;
  UserController(this.repository);

  dynamic isLogged = false;
  var message = ''.obs;

  final fullname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  var loading = false.obs;
  var visiblePassword = false.obs;

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  GlobalKey<FormState> registerForm = GlobalKey<FormState>();

  @override
  void onReady() async {
    super.onReady();
    getIsLogged();
  }

  getIsLogged() {
    loading.value = true;
    repository.getIsLogged().then((data) {
      isLogged = data;
    }, onError: (e) {
      message.value = 'Algo deu errado.';
    });
  }

  unsetSession() async {
    await repository.unsetSession().then((data) {
      Get.offAllNamed('login');
    }, onError: (e) {
      Get.offAllNamed('login');
    });
  }

  login() async {
    var validate = loginForm.currentState!.validate();

    if (validate) {
      loading.value = true;

      var user = await repository.login(username.text, password.text);
      if (user != null) {
        Get.offAllNamed('my_own_dex');
        loading.value = false;
      } else {
        message.value = 'Usuário não existe';
        loading.value = false;
      }
    }
  }

  userCreatePage() async {
    Get.offAllNamed('/user_create');
  }

  register() async {
    var validate = registerForm.currentState!.validate();

    if (validate) {
      loading.value = true;

      var user = await repository.store(User(
        name: fullname.text,
        username: username.text,
        password: password.text,
      ));
      if (user != null) {
        print(user);
        loading.value = false;
        Get.offAllNamed('login');
      } else {
        message.value = 'Erro ao cadastrar';
        loading.value = false;
      }
    }
  }
}
