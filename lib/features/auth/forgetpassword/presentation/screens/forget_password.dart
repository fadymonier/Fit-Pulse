import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.pushReplacementNamed("/SignIn"),
                child: Image.asset(
                    height: 80.h,
                    width: 80.w,
                    "assets/images/backContainer.png"),
              ),
              SizedBox(
                height: 55.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.r),
                child: AppTitle(
                    title: "Forgot Password",
                    showDivider: false,
                    textStyle: AppTextStyles.roboto24MainColor700),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.r),
                child: AppTitle(
                    title:
                        "write your username and we will send\nverification code on your registered account",
                    showDivider: false,
                    textStyle: AppTextStyles.roboto16GreyColor700),
              ),
              SizedBox(
                height: 55.h,
              ),
              AppTextField(
                labelText: "new password",
                obscureText: true,
                controller: controller,
                prefixIcon: CupertinoIcons.lock_fill,
                showSuffixIcon: true,
              ),
              SizedBox(
                height: 194.h,
              ),
              SizedBox(
                width: double.infinity,
                child: AppCustomBtn(
                  color: AppColors.mainColor,
                  text: "Reset Password",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
