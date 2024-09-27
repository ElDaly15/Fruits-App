import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/auth/presentation/views/forget_password_view.dart';
import 'package:fruits_app/featuers/auth/presentation/views/login_view.dart';
import 'package:fruits_app/featuers/auth/presentation/views/register_view.dart';
import 'package:fruits_app/featuers/home/presentation/views/home_page_view.dart';
import 'package:fruits_app/featuers/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_app/featuers/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());
    case HomePageView.routeName:
      return MaterialPageRoute(builder: (context) => const HomePageView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
