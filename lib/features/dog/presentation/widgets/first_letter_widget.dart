import 'package:flutter/material.dart';

class FirstLetterWidget extends StatelessWidget {
  final String text;
  const FirstLetterWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
