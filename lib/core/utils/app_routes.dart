import 'package:dog_ceo/core/constants/app_route_constants.dart';
import 'package:dog_ceo/features/dog/presentation/pages/dog_home.dart';
import 'package:dog_ceo/features/image/presentation/pages/image_screen.dart';
import 'package:dog_ceo/features/subBreed/presentation/page/sub_breed_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteConstants.dogHome,
        path: '/',
        builder: (context, state) => DogHomeScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.imageScreen,
        path: '/image',
        pageBuilder: (context, state) {
          Map<String, String> pathParams = state.uri.queryParameters;
          String breedName = pathParams['breed'] as String;
          String subBreedName = pathParams['sub_breed'] as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ImageScreen(breedName, subBreedName),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: AppRouteConstants.subBreedScreen,
        path: '/subBreed',
        pageBuilder: (context, state) {
          String dogName = state.extra as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: SubBreedScreen(
              dogName: dogName,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
