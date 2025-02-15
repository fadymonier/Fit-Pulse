import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBodyWidget extends StatelessWidget {
  const TextBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to FitPulse",
              style: AppTextStyles.roboto14BlackColor700,
            ),
            Text(
              "FitPulse helps you track players' physical measurements effortlessly. \nConnect with our advanced vest to receive real-time data and monitor player progress. \nEasily add, edit, and manage players, all in one place.",
              style: AppTextStyles.roboto14BlackColor400,
            ),
            SizedBox(height: 20.h),
            Text(
              "Why Choose FitPulse?",
              style: AppTextStyles.roboto14BlackColor700,
            ),
            Text(
              "✔ Real-time tracking with cutting-edge technology.\n✔ Simple and intuitive player management.\n✔ Detailed insights to improve performance.\n✔ Perfect for coaches, trainers, and sports teams.\n✔ Secure and reliable data storage with Firebase.",
              style: AppTextStyles.roboto14BlackColor400,
            ),
            SizedBox(height: 20.h),
            Text(
              "Get Ready to Boost Performance",
              style: AppTextStyles.roboto14BlackColor700,
            ),
            Text(
              "FitPulse empowers you to make data-driven decisions. Monitor progress, analyze trends, and help your players reach their full potential.",
              style: AppTextStyles.roboto14BlackColor400,
            ),
            SizedBox(height: 80.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: AppCustomBtn(
                  color: AppColors.mainColor,
                  text: "Get Started",
                  onPressed: () {
                    context.pushReplacementNamed("/SignIn");
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
