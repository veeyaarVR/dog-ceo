import 'dart:math';

import 'package:flutter/material.dart';

class DogCardWidget extends StatelessWidget {
  final String dogName;
  final DogSelectedCallBack onDogClicked;

  const DogCardWidget(
      {super.key, required this.dogName, required this.onDogClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onDogClicked(dogName);
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

typedef DogSelectedCallBack = void Function(String selectedDog);
