import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/features/auth/signin/presentation/widgets/signin_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/custom_btn.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                SigninBar(),
                SizedBox(height: 75.h),
                AppTitle(
                  title: "Welcome Back Couch,",
                  showDivider: false,
                  textStyle: AppTextStyles.roboto24MainColor700,
                ),
                SizedBox(height: 14.h),
                Text(
                  "Nice to see you again .",
                  style: AppTextStyles.roboto16GreyColor700,
                ),
                SizedBox(height: 75.h),
                AppTextField(
                    labelText: "  username",
                    obscureText: false,
                    controller: emailController,
                    prefixIcon: CupertinoIcons.person_fill),
                SizedBox(height: 34.h),
                AppTextField(
                    labelText: "  password",
                    obscureText: true,
                    controller: passwordController,
                    showSuffixIcon: true,
                    prefixIcon: CupertinoIcons.lock_fill),
                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed("/ForgetPassword");
                    },
                    child: Text(
                      "Forget Password ?",
                      style: AppTextStyles.roboto16GreyColor700,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: double.infinity,
                  child: AppCustomBtn(
                      color: AppColors.mainColor,
                      onPressed: () {},
                      text: "Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
