import 'package:flutter/material.dart';
import 'package:flutter_pokemon_example/app/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon_example/app/domain/usecases/get_pokemon_usecases.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/home_injection.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/interfaces/home_interface.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  late TextEditingController searchController;
  late GetPokemonsUsecases _getPokemonsUsecases;

  List<PokemonEntity> pokemons = [];
  List<PokemonEntity> fetchedPokemons = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _getPokemonsUsecases = homeInject.get<GetPokemonsUsecases>();

    _fetchPokemons();
  }

  Future<void> _fetchPokemons() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await _getPokemonsUsecases.execute();
      setState(() {
        pokemons = result;
        fetchedPokemons = result;
      });
    } catch (e) {
      setState(() {
        pokemons = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void handleFilterPokemons(String pokemonName) {
    setState(
      () {
        pokemons = fetchedPokemons
            .where(
              (pokemon) => pokemon.name
                  .toLowerCase()
                  .contains(pokemonName.toLowerCase()),
            )
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeInterface(
      searchController: searchController,
      handleFilterPokemons: handleFilterPokemons,
      pokemons: pokemons,
      isLoading: isLoading,
    );
  }
}
