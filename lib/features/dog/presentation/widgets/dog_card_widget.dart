import 'dart:math';

import 'package:dog_ceo/core/constants/app_route_constants.dart';
import 'package:dog_ceo/core/utils/color_generator_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DogCardWidget extends StatelessWidget {
  final String dogName;

  /// renders dog card with dynamic card color
  const DogCardWidget({super.key, required this.dogName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .pushNamed(AppRouteConstants.subBreedScreen, extra: dogName);
      },
      child: Container(
          decoration: BoxDecoration(
              color: ColorGeneratorHelper().generateColorByString(dogName),
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
