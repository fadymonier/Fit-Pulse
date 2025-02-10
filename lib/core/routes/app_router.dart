import 'package:fitpulse/features/add_player/presentation/screens/add_player_screen.dart';
import 'package:fitpulse/features/auth/forgetpassword/presentation/screens/forget_password.dart';
import 'package:fitpulse/features/auth/register/presentation/screens/register_screen.dart';
import 'package:fitpulse/features/auth/signin/presentation/screens/signin_screen.dart';
import 'package:fitpulse/features/home/presentation/screens/home_screen.dart';
import 'package:fitpulse/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fitpulse/features/player_info/presentation/screens/player_info_screen.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/player_statstics.dart';
import 'package:fitpulse/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = "/";
  static const String onBoarding = "/OnBoarding";
  static const String signIn = "/SignIn";
  static const String register = "/Register";
  static const String forgetPassword = "/ForgetPassword";
  static const String home = "/Home";
  static const String playerInfo = "/PlayerInfo";
  static const String playetStatistics = "/PlayetStatistics";
  static const String addPlayer = "/AddPlayer";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => SigninScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case playerInfo:
        return MaterialPageRoute(builder: (_) => const PlayerInfoScreen());
      case playetStatistics:
        return MaterialPageRoute(builder: (_) => const PlayerStatstics());
      case addPlayer:
        return MaterialPageRoute(builder: (_) => const AddPlayerScreen());

      default:
        return null;
    }
  }
}
