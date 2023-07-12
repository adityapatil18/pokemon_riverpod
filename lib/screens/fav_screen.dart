import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/Providers/pokemon_provider.dart';
import 'package:pokemon_riverpod/model/pokemon.dart';
import 'package:pokemon_riverpod/screens/detail_pokemon.dart';
import 'package:pokemon_riverpod/utils/helper.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Fav Pokemon'),
        centerTitle: false,
      ),
      body: Consumer(builder: (context, ref, child) {
        final pokemonNotifier = ref.watch(pokemonProvider);
        return pokemonNotifier.favPokemon.isNotEmpty
            ? ListView.builder(
                itemCount: pokemonNotifier.favPokemon.length,
                itemBuilder: (context, index) {
                  Pokemon pokemon = pokemonNotifier.favPokemon[index];
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 30,
                              left: 10,
                              right: 10,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Helper.getPokemonCardColour(
                                      pokemonType: pokemon.typeofpokemon![0]),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Text(pokemon.name!,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            Text(pokemon.id!,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),),
                               CachedNetworkImage(
                            imageUrl: pokemon.imageurl!,
                            width: 150,
                            height: 150,
                          ),
                        ],
                      ),
                       onTap: () {
                        pokemonNotifier.setSelectedPokemon(pokemon);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailPokemon()));
                      },
                    ),
                  );
                })
            : const Center(child: Text('No Fav Pokemon'));
      }),
    );
  }
}
