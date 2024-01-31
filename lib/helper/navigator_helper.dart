import 'package:flutter/material.dart';

class NavigatorHelper {

  void toSpecificPage({required BuildContext context, required Widget page}) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => page)
    );
  }

  void toPreviousPage({required BuildContext context}) {
    Navigator.pop(context);
  }
}