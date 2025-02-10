// ignore_for_file: use_build_context_synchronously

import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/features/home/presentation/widgets/add_player_widget.dart';
import 'package:fitpulse/features/home/presentation/widgets/player_card.dart';
import 'package:fitpulse/firebase/functions/firebase_auth_functions.dart';
import 'package:fitpulse/firebase/functions/firebase_data_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _isSigningOut ? null : () => _showLogoutDialog(context),
            icon: Icon(Icons.logout_rounded, color: AppColors.mainColor),
          ),
          SizedBox(width: 8.w)
        ],
        automaticallyImplyLeading: false,
        title: AppTitle(
          title: "Select Player",
          showDivider: false,
          textStyle: AppTextStyles.roboto20MainColor700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0.r),
        child: Column(
          children: [
            PlayerCard(),
            SizedBox(height: 26.h),
            // FutureBuilder(
            //     future: FirebaseDataFunctions.getPlayersData(),
            //     builder: (context, snapshot) {}),
            SizedBox(height: 26.h),
            AddPlayerWidget(),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: !_isSigningOut,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.scaffoldBackgroundColor,
              title: Text("Logout", style: AppTextStyles.roboto24MainColor700),
              content: _isSigningOut
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Signing out...",
                            style: AppTextStyles.roboto20BlackColor700),
                        SizedBox(height: 20.h),
                        CircularProgressIndicator(color: AppColors.mainColor),
                      ],
                    )
                  : Text("Are you sure?",
                      style: AppTextStyles.roboto20BlackColor700),
              actions: _isSigningOut
                  ? []
                  : [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No",
                            style: AppTextStyles.roboto18BlackColor500),
                      ),
                      TextButton(
                        onPressed: () async {
                          setState(() => _isSigningOut = true);
                          await FirebaseAuthFunctions.signOut();
                          if (mounted) {
                            Navigator.pop(context);
                            context.pushReplacementNamed("/SignIn");
                          }
                        },
                        child: Text("Yes",
                            style: AppTextStyles.roboto18RedColor500),
                      ),
                    ],
            );
          },
        );
      },
    );
  }
}
