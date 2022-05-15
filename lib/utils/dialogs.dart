import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static alert(BuildContext context,
      {required String title, required String description}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(description),
              actions: [
                CupertinoButton(
                    child: Text("OK"), onPressed: () => Navigator.pop(context)),
                //CupertinoButton(child: Text("Cancel"), onPressed: () {}),
              ],
            ));
  }
}

abstract class ProgresDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            color: Colors.white.withOpacity(0.9),
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static dissMiss(BuildContext context) {
    Navigator.pop(context);
  }
}
