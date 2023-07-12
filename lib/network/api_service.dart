import 'dart:convert';

import 'package:pokemon_riverpod/network/netwrok_api_service.dart';

import '../model/pokemon.dart';
import '../utils/constant.dart';

class ApiService extends NetworkApiService{
  Future<List<Pokemon>> getPokemonList() async{
    final response = await getResponse(POKEMON_API_URL);
    final List jsonResponse = json.decode(response);
    return jsonResponse.map((e) => Pokemon.fromJson(e)).toList();
  }
}