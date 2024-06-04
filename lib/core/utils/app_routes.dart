import 'package:dog_ceo/core/constants/app_route_constants.dart';
import 'package:dog_ceo/features/dog/presentation/pages/dog_home.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteConstants.dogHome,
        path: '/',
        builder: (context, state) => DogHomeScreen(),
      ),
    ],
  );
}
