import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText(
      {Key? key,
      this.obscureText = false,
      required this.label,
      this.suffix = false,
      required this.fontSize,
      this.onChanged,
      this.validator})
      : super(key: key);

  final bool obscureText, suffix;
  final String label;

  ///Tamaño de la fuente
  final double fontSize;

  ///Obtiene el texto escrito
  ///
  /// (text) { manipulo el text}
  final void Function(String text)? onChanged;

  ///Si retorna null pasa la validacion
  String? Function(String? text)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: label,
          suffix: suffix
              ? CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onPressed: () {})
              : null),
      style: TextStyle(fontSize: fontSize),
    );
  }
}
