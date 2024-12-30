import 'package:flutter_pokemon_example/app/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon_example/app/domain/repositories/pokemon_repository.dart';

class GetPokemonsUsecases {
  PokemonRepository pokemonRepository;

  GetPokemonsUsecases(this.pokemonRepository);

  Future<List<PokemonEntity>> execute() {
    return pokemonRepository.getPokemon();
  }
}
