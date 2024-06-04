import 'dart:math';

import 'package:dog_ceo/core/constants/app_route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubBreedItem extends StatelessWidget {
  final String subBreedName;
  final String breedName;

  const SubBreedItem(
      {super.key, required this.subBreedName, required this.breedName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .pushNamed(AppRouteConstants.imageScreen, extra: breedName);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    subBreedName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
