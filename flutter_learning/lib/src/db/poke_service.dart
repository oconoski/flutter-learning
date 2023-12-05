import 'package:flutter_learning/src/data/models/poke_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class PokeService extends GetxService {
  late Database db;

  Future<PokeService> init() async {
    db = await _getDatabase();

    return this;
  }

  Future<Database> _getDatabase() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'pokedex.db');

    Database db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS pokemons (id INTEGER PRIMARY KEY, name TEXT, image TEXT)');
    });
    return db;
  }

  Future<List<Poke>> get() async {
    final result = await db.rawQuery('SELECT * FROM pokemons ORDER BY id');

    return result.map((json) => Poke.fromJson(json)).toList();
  }

  Future<Poke> store(Poke pokemon) async {
    final id = await db.rawInsert('INSERT INTO pokemons (name, image) VALUES (?, ?)', [pokemon.name, pokemon.image]);

    return pokemon.copy(id: id);
  }

  Future<Poke> update(Poke pokemon) async {
    final id = await db.rawUpdate('UPDATE users SET name = ?, image = ? WHERE id = ?', [pokemon.name, pokemon.image, pokemon.id]);

    return pokemon.copy(id: id);
  }

  Future<int> delete(int pokemonId) async {
    final id = await db.rawDelete('DELETE FROM pokemons WHERE id = ?', [pokemonId]);

    return id;
  }

  Future close() async {
    db.close();
  }
}
