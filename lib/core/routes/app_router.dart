import 'package:fitpulse/features/home/presentation/screens/home_screen.dart';
import 'package:fitpulse/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = "/";
  static const String onBoarding = "/OnBoarding";
  static const String home = "/Home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}
