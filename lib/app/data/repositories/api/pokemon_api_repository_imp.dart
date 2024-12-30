import 'dart:convert';

import 'package:flutter_pokemon_example/app/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon_example/app/domain/repositories/pokemon_repository.dart';
import 'package:http/http.dart' as http;

class PokemonApiRepositoryImp implements PokemonRepository {
  final Uri _baseUrl = Uri(
    scheme: "https",
    host: "pokeapi.co",
    path: "/api/v2/pokemon",
  );

  @override
  Future<List<PokemonEntity>> getPokemon() async {
    var response = await http.get(_baseUrl);

    if (response.statusCode != 200) {
      return [];
    }

    var responseDecoded = jsonDecode(response.body);
    var results = responseDecoded["results"];

    for (var result in results) {
      var responseImage = await http.get(Uri.parse(result["url"]));

      if (responseImage.statusCode != 200) {
        return [];
      }

      var responseDecoded = jsonDecode(responseImage.body);

      var urlImage = responseDecoded["sprites"]["front_shiny"];

      result["url"] = urlImage;
    }

    return results
        .map<PokemonEntity>((pokemon) => PokemonEntity.fromJson(pokemon))
        .toList();
  }
}
