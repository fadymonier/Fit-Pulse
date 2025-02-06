import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:fitpulse/core/widgets/gender_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterDataList extends StatelessWidget {
  const RegisterDataList({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
                labelText: "name",
                obscureText: false,
                controller: nameController,
                prefixIcon: Icons.person),
            SizedBox(height: 18.h),
            AppTextField(
                labelText: "email",
                obscureText: false,
                controller: emailController,
                prefixIcon: Icons.account_circle_rounded),
            SizedBox(height: 18.h),
            GenderMenu(selectedGender: "Male", onChanged: (value) {}),
            SizedBox(height: 18.h),
            AppTextField(
                labelText: "phone",
                obscureText: false,
                controller: phoneController,
                prefixIcon: Icons.phone),
            SizedBox(height: 18.h),
            AppTextField(
                labelText: "password",
                obscureText: true,
                showSuffixIcon: true,
                controller: passwordcontroller,
                prefixIcon: CupertinoIcons.lock_fill),
            SizedBox(height: 18.h),
            AppTextField(
                labelText: "Confirm Password",
                obscureText: true,
                showSuffixIcon: true,
                controller: confirmPasswordController,
                prefixIcon: CupertinoIcons.lock_fill),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              child: AppCustomBtn(
                  color: AppColors.mainColor,
                  text: "Rigester Now",
                  onPressed: () {
                    context.pushReplacementNamed("/SignIn");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
