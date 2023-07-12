import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/utils/hive_services.dart';

import '../model/pokemon.dart';
import '../network/api_service.dart';

class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _allPokemon = [];
  Pokemon? _selectedPokemon;
  List<Pokemon> _favPokemon = [];
  HiveService hiveService = HiveService();
  bool _isFav = true;

  List<Pokemon> get allPokemon => _allPokemon;
  Pokemon? get selectedPokemon => _selectedPokemon;
  List<Pokemon> get favPokemon => _favPokemon;
  bool get isFav => _isFav;

  Future<void> getPokemons() async {
    final apiService = ApiService();
    _allPokemon = await apiService.getPokemonList();
    log('getPokemons: ${_allPokemon.length}');
    notifyListeners();
  }

  void setSelectedPokemon(Pokemon pokemon) {
    _selectedPokemon = pokemon;
    log(pokemon.hashCode.toString() + ' ' + pokemon.hashCode.toString());
    _isFav = _favPokemon.contains(pokemon);
    notifyListeners();
  }

  Future getFavPokemon() async {
    _favPokemon = await hiveService.getPokemon();
    if (selectedPokemon != null) {
      _isFav = _favPokemon.contains(selectedPokemon);
    }
    notifyListeners();
  }

  Future toggleFavPokemon() async {
    if (_favPokemon.contains(selectedPokemon)) {
      await hiveService.removePokemon(selectedPokemon!.id!);
      log('Pokemon removed from fav ${selectedPokemon!.name}');

      _isFav = false;
      await getFavPokemon();

      notifyListeners();
    } else {
      await hiveService.addPokemon(selectedPokemon!);
      log('Pokemon added to fav ${selectedPokemon!.name}');
      _isFav = false;

      await getFavPokemon();
      notifyListeners();
    }
  }
}

final pokemonProvider = ChangeNotifierProvider((ref) => PokemonProvider());
