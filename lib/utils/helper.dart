import 'package:flutter/material.dart';
import 'package:pokemon_riverpod/utils/constant.dart';

enum MessageType { info, success, warning, error }

class Helper {
  static String getStringOutOfList(String stringList) {
    return stringList.toString().replaceAll('[', '').replaceAll(']', '');
  }

  static Color getSnackBarDecoColour({required MessageType type}) {
    switch (type) {
      case MessageType.info:
        return darkBlue;
      case MessageType.success:
        return darkGreen;
      case MessageType.warning:
        return darkYellow;
      case MessageType.error:
        return darkRed;
    }
  }

  static Color getSnackBarBgColour({required MessageType type}) {
    switch (type) {
      case MessageType.info:
        return lightBlue;
      case MessageType.success:
        return lightGreen;
      case MessageType.warning:
        return lightYellow;
      case MessageType.error:
        return lightRed;
    }
  }

  static Color? getPokemonCardColour({required String pokemonType}) {
    switch (pokemonType) {
      case 'Normal':
        return lightBlue;
      case 'Fire':
        return darkRed;
      case 'Water':
        return lightBlue;
      case 'Electric':
        return Colors.amber;
      case 'Grass':
        return lightGreen;
      case 'Ice':
        return lightBlue;
      case 'Fighting':
        return Colors.orange[900];
      case 'Poison':
        return Colors.deepPurpleAccent;
      case 'Ground':
        return Colors.brown;
      case 'Glying':
        return darkBlue;
      case 'Psychic':
        return darkYellow;
      case 'Bug':
        return Colors.green[200];
      case 'Rock':
        return Colors.grey[500];
      case 'Ghost':
        return Colors.deepPurple;
      case 'Dragon':
        return darkGreen;
      case 'Dark':
        return darkBlue;
      case 'Steel':
        return darkYellow;
      case 'Fairy':
        return darkGreen;
      default:
        return lightBlue;
    }
  }
}
