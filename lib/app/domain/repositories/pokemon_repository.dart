import 'package:flutter_pokemon_example/app/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemon();
}
