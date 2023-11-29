import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  const AppButton({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPress,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
