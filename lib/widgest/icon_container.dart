import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({Key? key, required this.size})
      : assert(size >= 0),
        super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size * 0.28,
        height: size * 0.28,
        padding: EdgeInsets.all(size * 0.03),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.05),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 15, offset: Offset(0, 8))
            ]),
        child: Image.asset(
          "assets/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
