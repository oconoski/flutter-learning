import 'package:flutter_learning/src/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class UserService extends GetxService {
  late Database db;

  Future<UserService> init() async {
    db = await _getDatabase();

    return this;
  }

  Future<Database> _getDatabase() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'pokedex.db');

    Database db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT)');
    });

    await db.execute('CREATE TABLE IF NOT EXISTS token (logged INTEGER NULLABLE)');
    await db.execute('CREATE TABLE IF NOT EXISTS pokemons (id INTEGER PRIMARY KEY, name TEXT, type TEXT, image TEXT)');
    return db;
  }

  Future<List<User>> get() async {
    final result = await db.rawQuery('SELECT * FROM users ORDER BY id');

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future login(username, password) async {
    final result = await db.rawQuery('SELECT * FROM users WHERE username = ? AND password = ?', [username, password]);

    if (result.isNotEmpty) {
      await db.rawInsert('INSERT INTO token (logged) VALUES (1)');
      return result.first;
    } else {
      return null;
    }
  }

  Future<bool> isLogged() async {
    final result = await db.rawQuery('SELECT * FROM token');
    print(result);
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<User> store(User user) async {
    final id = await db.rawInsert('INSERT INTO users (name, username, password) VALUES (?, ?, ?)', [user.name, user.username, user.password]);
    await db.rawInsert('INSERT INTO token (logged) VALUES (1)');

    return user.copy(id: id);
  }

  Future<bool> unsetSession() async {
    await db.rawDelete('DELETE FROM token');

    return true;
  }

  Future<User> update(User user) async {
    final id = await db.rawUpdate('UPDATE users SET name = ?, username = ?, password = ? WHERE id = ?', [user.name, user.username, user.password, user.id]);

    return user.copy(id: id);
  }

  Future<int> delete(int userId) async {
    final id = await db.rawDelete('DELETE FROM user WHERE id = ?', [userId]);
    await db.delete('DELETE FROM token');
    await db.delete('DELETE FROM pokemons');

    return id;
  }

  Future close() async {
    db.close();
  }
}
