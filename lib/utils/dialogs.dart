import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgresDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.white.withOpacity(0.9),
          width: double.infinity,
          height: double.infinity,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  static dissMiss(BuildContext context) {
    Navigator.pop(context);
  }
}
