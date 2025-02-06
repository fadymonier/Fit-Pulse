import 'package:fitpulse/features/auth/register/presentation/widgets/register_bar.dart';
import 'package:fitpulse/features/auth/register/presentation/widgets/register_data_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/app_title.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              RegisterBar(),
              SizedBox(height: 30.h),
              AppTitle(
                title: "Hello Couch,",
                showDivider: false,
                textStyle: AppTextStyles.roboto24MainColor700,
              ),
              SizedBox(height: 14.h),
              Text(
                "Nice to see you for first time .",
                style: AppTextStyles.roboto16GreyColor700,
              ),
              SizedBox(height: 35.h),
              RegisterDataList(),
            ],
          ),
        ),
      ),
    );
  }
}
