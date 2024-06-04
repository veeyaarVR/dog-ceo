import 'dart:math';

import 'package:dog_ceo/features/subBreed/presentation/widgets/sub_breed_bottom_sheet.dart';
import 'package:flutter/material.dart';

class DogCardWidget extends StatelessWidget {
  final String dogName;

  /// renders dog card with dynamic card color
  const DogCardWidget({super.key, required this.dogName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: true,
          builder: (BuildContext context) {
            return SubBreedBottomSheet(dogName: dogName);
          },
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.accents[Random().nextInt(Colors.accents.length)],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                    dogName)),
          )),
    );
  }
}
