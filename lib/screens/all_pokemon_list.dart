import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/Providers/pokemon_provider.dart';
import 'package:pokemon_riverpod/screens/detail_pokemon.dart';
import 'package:pokemon_riverpod/screens/fav_screen.dart';
import 'package:pokemon_riverpod/utils/helper.dart';

import '../Providers/theme_providers.dart';

class AllPokemonList extends ConsumerStatefulWidget {
  const AllPokemonList({super.key});

  @override
  ConsumerState<AllPokemonList> createState() => _AllPokemonListState();
}

class _AllPokemonListState extends ConsumerState<AllPokemonList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(pokemonProvider).getFavPokemon();
      await ref.read(pokemonProvider).getPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final pokemonNotifier = ref.watch(pokemonProvider);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: const Text('All Pokemon'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FavScreen()));
                },
                icon: Icon(Icons.favorite)),
            IconButton(
              icon: const Icon(Icons.light_mode),
              onPressed: () {
                ref.read(themeProvider).toggleTheme();
              },
            ),
          ],
        ),
        body: pokemonNotifier.allPokemon.isNotEmpty
            ? GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: pokemonNotifier.allPokemon.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.2),
                itemBuilder: (context, index) {
                  final pokemon = pokemonNotifier.allPokemon[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                    child: GestureDetector(
                      child: Card(
                        color: Helper.getPokemonCardColour(
                            pokemonType: pokemon.typeofpokemon![0]),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -10,
                              right: -1,
                              child: Image.asset(
                                'images/pokeball.png',
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Hero(
                                tag: pokemon.id!,
                                child: CachedNetworkImage(
                                  imageUrl: pokemon.imageurl!,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 15,
                              child: Text(
                                pokemon.name!,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Text(
                                    pokemon.typeofpokemon![0].toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        pokemonNotifier.setSelectedPokemon(pokemon);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPokemon(),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
      );
    });
  }
}
