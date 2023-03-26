import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  const TextData({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Control ',
        style: const TextStyle(fontSize: 25.00),
        children: <TextSpan>[
          TextSpan(
            text: message,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.00,
                color: Colors.red),
          ),
        ],
      ),
    );
  }
}
