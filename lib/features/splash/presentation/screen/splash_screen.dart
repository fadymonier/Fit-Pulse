// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, unrelated_type_equality_checks, deprecated_member_use

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitpulse/core/routes/app_router.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/manager/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection, show dialog
      _showNoConnectionDialog();
    } else {
      // Check if the user is logged in
      if (myProvider.firebaseUser != null) {
        // User is logged in, navigate to the home screen
        Navigator.pushReplacementNamed(context, AppRouter.home);
      } else {
        // User is not logged in, navigate to the onboarding screen
        Navigator.pushReplacementNamed(context, AppRouter.onBoarding);
      }
    }
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text(
              'Please check your internet connection and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Exit the app
                Future.delayed(const Duration(milliseconds: 100), () {
                  // Exit the app
                  SystemNavigator.pop();
                });
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                // Open mobile settings
                const url = 'app-settings:';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text('Settings'),
            ),
          ],
        );
      },
    );
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
