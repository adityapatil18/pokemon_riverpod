import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/utils/helper.dart';
import 'package:pokemon_riverpod/widgtes/pokemon_detail_widget.dart';
import 'package:pokemon_riverpod/widgtes/roatating_pokeball.dart';

import '../Providers/pokemon_provider.dart';

class DetailPokemon extends ConsumerWidget {
  const DetailPokemon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final pokemonNotifier = ref.watch(pokemonProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: pokemonNotifier.isFav == true
                ? const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.white,
                  ),
            onPressed: () async {
              pokemonNotifier.toggleFavPokemon();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: pokemonNotifier.isFav
                      ? Text("Removed from fav")
                      : Text('Added to fav'),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Helper.getPokemonCardColour(
          pokemonType: pokemonNotifier.selectedPokemon!.typeofpokemon![0]),
      body: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemonNotifier.selectedPokemon!.name!,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  pokemonNotifier.selectedPokemon!.id!,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            left: 22,
            top: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Helper.getStringOutOfList(
                      pokemonNotifier.selectedPokemon!.typeofpokemon!
                          .toString(),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.1,
            left: (width / 2) - 100,
            child: RotatingPokeball(width: 200),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              height: height * 0.56,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pokemonNotifier.selectedPokemon!.xdescription!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    PokemonDetailWidget(
                        width: width,
                        title: 'Type',
                        value:
                            pokemonNotifier.selectedPokemon!.typeofpokemon![0]),
                    PokemonDetailWidget(
                        width: width,
                        title: 'Category',
                        value: pokemonNotifier.selectedPokemon!.category!),
                    PokemonDetailWidget(
                        width: width,
                        title: 'Height',
                        value: pokemonNotifier.selectedPokemon!.height!),
                    PokemonDetailWidget(
                        width: width,
                        title: 'Weight',
                        value: pokemonNotifier.selectedPokemon!.weight!),
                    PokemonDetailWidget(
                      width: width,
                      title: 'Weakness',
                      value: Helper.getStringOutOfList(
                          pokemonNotifier.selectedPokemon!.weaknesses!),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.12,
            left: (width / 2) - 100,
            child: Hero(
              tag: pokemonNotifier.selectedPokemon!.id!,
              child: CachedNetworkImage(
                imageUrl: pokemonNotifier.selectedPokemon!.imageurl!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
