import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/features/onboarding/presentation/widgets/text_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/app_title.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: 'About Application',
                showDivider: true,
                textStyle: AppTextStyles.roboto20MainColor700,
              ),
              SizedBox(
                height: 20.h,
              ),
              Image.asset('assets/images/onBoardingPic.png'),
              SizedBox(
                height: 10.h,
              ),
              TextBodyWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
