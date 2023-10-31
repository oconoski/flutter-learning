import 'package:flutter_learning/src/data/models/user_model.dart';
import 'package:flutter_learning/src/db/user_service.dart';
import 'package:get/get.dart';

class UserProvider {
  final userService = Get.find<UserService>();

  Future<List<User>> get() async {
    return await userService.get();
  }

  Future<bool> isLogged() async {
    return await userService.isLogged();
  }

  Future<bool> unsetSession() async {
    return await userService.unsetSession();
  }

  Future<User> store(User user) async {
    return await userService.store(user);
  }

  Future login(String username, String password) async {
    return await userService.login(username, password);
  }

  Future<User> update(User user) async {
    return await userService.update(user);
  }

  Future<int> delete(int id) async {
    return await userService.delete(id);
  }
}
