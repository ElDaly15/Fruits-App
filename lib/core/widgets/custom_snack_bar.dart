import 'package:flutter/material.dart';

class CustomSnackBar {
  showCustomSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
