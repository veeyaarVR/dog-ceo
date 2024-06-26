import 'package:flutter/material.dart';

class FirstLetterWidget extends StatelessWidget {
  final String text;

  /// Widget to render alphabets text.
  const FirstLetterWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
