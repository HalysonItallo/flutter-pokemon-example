import 'package:flutter_pokemon_example/app/data/repositories/api/pokemon_api_repository_imp.dart';
import 'package:flutter_pokemon_example/app/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_example/app/domain/usecases/get_pokemon_usecases.dart';
import 'package:get_it/get_it.dart';

GetIt homeInject = GetIt.instance;

void setupHomeInject() {
  homeInject.registerLazySingleton<PokemonRepository>(
      () => PokemonApiRepositoryImp());

  homeInject.registerLazySingleton<GetPokemonsUsecases>(
      () => GetPokemonsUsecases(homeInject.get<PokemonRepository>()));
}
