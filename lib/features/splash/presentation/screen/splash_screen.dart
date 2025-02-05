// ignore_for_file: library_private_types_in_public_api

import 'package:fitpulse/core/routes/app_router.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

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

  void delayedNavigate(context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          fit: BoxFit.fill,
          image: AssetImage(
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
              image: AssetImage(
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
                    indicatorType: Indicator.circleStrokeSpin))
          ],
        ),
      ],
    );
  }
}
