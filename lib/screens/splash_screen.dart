import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/Providers/pokemon_provider.dart';
import 'package:pokemon_riverpod/screens/all_pokemon_list.dart';
import 'package:pokemon_riverpod/widgtes/roatating_pokeball.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      await ref.read(pokemonProvider).getPokemons().then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const AllPokemonList()),
            (route) => false);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(
        child: RotatingPokeball(
          width: 200,
          image: 'images/pokeball_image.png',
        ),
      ),
    );
  }
}
