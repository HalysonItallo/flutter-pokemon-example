import 'package:flutter/material.dart';
import 'package:flutter_pokemon_example/app/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/components/card_pokemon.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/components/input_search.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/components/loading.dart';

class HomeInterface extends StatelessWidget {
  final TextEditingController searchController;
  final Function handleFilterPokemons;
  final List<PokemonEntity> pokemons;
  final bool isLoading;

  const HomeInterface({
    super.key,
    required this.searchController,
    required this.handleFilterPokemons,
    required this.pokemons,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 46),
          child: Column(
            children: [
              InputSearch(
                controller: searchController,
                onChanged: (value) => handleFilterPokemons(value),
              ),
              Expanded(
                child: isLoading
                    ? const Loading()
                    : pokemons.isEmpty
                        ? const Center(
                            child: Text("Nenhum Pokémon encontrado!"),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 45),
                            itemCount: pokemons.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                child: CardPokemon(
                                  name: pokemons[index].name,
                                  url: pokemons[index].url,
                                ),
                              );
                            },
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
