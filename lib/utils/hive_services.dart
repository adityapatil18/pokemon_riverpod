import 'package:hive_flutter/hive_flutter.dart';

import '../model/pokemon.dart';

class HiveService {
  static const String _boxName = 'pokemonBox';

  Future addPokemon(Pokemon pokemon) async {
    final box = await Hive.openBox(_boxName);
    box.put(pokemon.id, pokemon);
  }

  Future<List<Pokemon>> getPokemon() async {
    final box = await Hive.openBox(_boxName);
    return box.values.toList().cast<Pokemon>();
  }

  Future removePokemon(String id) async {
    final box = await Hive.openBox(_boxName);
    box.delete(id);
  }
}
