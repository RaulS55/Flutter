import 'package:flutter/material.dart';

///Crea un container circular
class Circle extends StatelessWidget {
  Circle({
    Key? key,
    required this.size,
    required this.colors,
  })  : assert(size > 0),
        super(key: key);
  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ));
  }
}
