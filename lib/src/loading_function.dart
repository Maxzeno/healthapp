import 'package:flutter/material.dart';

class LoadingFunction {
  static load({required BuildContext context}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
