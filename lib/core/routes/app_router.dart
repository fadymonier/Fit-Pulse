import 'package:fitpulse/features/auth/forgetpassword/presentation/screens/forget_password.dart';
import 'package:fitpulse/features/auth/register/presentation/screens/register_screen.dart';
import 'package:fitpulse/features/auth/signin/presentation/screens/signin_screen.dart';
import 'package:fitpulse/features/home/presentation/screens/home_screen.dart';
import 'package:fitpulse/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fitpulse/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = "/";
  static const String onBoarding = "/OnBoarding";
  static const String signIn = "/SignIn";
  static const String register = "/Register";
  static const String forgetPassword = "/ForgetPassword";
  static const String home = "/Home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
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
