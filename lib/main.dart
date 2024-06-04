import 'package:dog_ceo/core/utils/app_routes.dart';
import 'package:dog_ceo/features/dog/presentation/pages/dog_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dog CEO',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'JosefinSans'),
      routerConfig: AppRoutes().router,
    );
  }
}
