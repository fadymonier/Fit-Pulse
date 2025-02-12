// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:fitpulse/core/routes/app_router.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart'; // Import Provider

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayedNavigate(context);
  }

  void delayedNavigate(BuildContext context) async {
    // Access the MyProvider instance
    final myProvider = Provider.of<MyProvider>(context, listen: false);

    // Wait for 5 seconds
    await Future.delayed(const Duration(seconds: 5));

    // Check if the user is logged in
    if (myProvider.firebaseUser != null) {
      // User is logged in, navigate to the home screen
      Navigator.pushReplacementNamed(context, AppRouter.home);
    } else {
      // User is not logged in, navigate to the onboarding screen
      Navigator.pushReplacementNamed(context, AppRouter.onBoarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          fit: BoxFit.fill,
          image: const AssetImage(
            'assets/images/splashBG.png',
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 335.h,
            ),
            Image(
              width: 200.w,
              fit: BoxFit.fill,
              image: const AssetImage(
                'assets/images/splashCenterLogo.png',
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            SizedBox(
              height: 70.h,
              width: 70.w,
              child: LoadingIndicator(
                colors: [AppColors.whiteColor],
                strokeWidth: 5.w,
                indicatorType: Indicator.circleStrokeSpin,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
