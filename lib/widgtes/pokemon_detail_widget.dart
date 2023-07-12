import 'package:flutter/material.dart';

class PokemonDetailWidget extends StatelessWidget {
  const PokemonDetailWidget(
      {super.key,
      required this.width,
      required this.title,
      required this.value});

  final double width;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
