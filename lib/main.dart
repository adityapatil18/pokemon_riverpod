import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokemon_riverpod/Providers/theme_providers.dart';
import 'package:pokemon_riverpod/model/pokemon.dart';
import 'package:pokemon_riverpod/screens/splash_screen.dart';
import 'package:pokemon_riverpod/theme/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  runApp(ProviderScope(child: PokemonRiverpod()));
}

class PokemonRiverpod extends StatelessWidget {
  const PokemonRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeNotifier = ref.watch(themeProvider);

      return MaterialApp(
        theme: Styles.themeData(themeNotifier.isDarkMode, context),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}
