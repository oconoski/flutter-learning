import 'package:flutter_learning/src/data/models/poke_model.dart';
import 'package:flutter_learning/src/data/providers/poke_provider.dart';

class PokeRepository {
  final PokeProvider pokeProvider;
  PokeRepository(
    this.pokeProvider,
  );

  get() {
    return pokeProvider.get();
  }

  store(Poke poke) {
    return pokeProvider.store(poke);
  }

  update(Poke poke) {
    return pokeProvider.update(poke);
  }

  delete(int id) {
    return pokeProvider.delete(id);
  }
}
