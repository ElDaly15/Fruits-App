import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper/on_generate_routes.dart';
import 'package:fruits_app/featuers/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
