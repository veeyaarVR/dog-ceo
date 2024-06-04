import 'dart:math';

import 'package:flutter/material.dart';

class SubBreedItem extends StatelessWidget {
  final String subBreedName;

  const SubBreedItem({super.key, required this.subBreedName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            subBreedName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
