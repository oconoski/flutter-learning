import 'package:flutter_learning/src/data/models/user_model.dart';
import 'package:flutter_learning/src/data/providers/user_provider.dart';

class UserRepository {
  final UserProvider userProvider;
  UserRepository(
    this.userProvider,
  );

  get() {
    return userProvider.get();
  }

  getIsLogged() {
    return userProvider.isLogged();
  }

  unsetSession() {
    return userProvider.unsetSession();
  }

  store(User user) {
    return userProvider.store(user);
  }

  login(String username, String password) {
    return userProvider.login(username, password);
  }

  update(User user) {
    return userProvider.update(user);
  }

  delete(int id) {
    return userProvider.delete(id);
  }
}
