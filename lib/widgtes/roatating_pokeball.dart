import 'package:flutter/material.dart';

class RotatingPokeball extends StatefulWidget {
  const RotatingPokeball(
      {super.key, required this.width, this.image = 'images/pokeball.png'});

  final double width;
  final String image;
  @override
  State<RotatingPokeball> createState() => _RotatingPokeballState();
}

class _RotatingPokeballState extends State<RotatingPokeball>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 3.14 * 2,
          child: Image.asset(
            widget.image,
            width: widget.width,
            fit: BoxFit.fitWidth,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
