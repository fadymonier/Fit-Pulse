import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:fitpulse/firebase/functions/firebase_auth_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/images/backContainer.png",
                      height: 80.h,
                      width: 80.w,
                    ),
                  ),
                  SizedBox(height: 55.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0.r),
                    child: AppTitle(
                      title: "Forgot Password",
                      showDivider: false,
                      textStyle: AppTextStyles.roboto24MainColor700,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0.r),
                    child: AppTitle(
                      title:
                          "write your username and we will send\nverification code on your registered account",
                      showDivider: false,
                      textStyle: AppTextStyles.roboto16GreyColor700,
                    ),
                  ),
                  SizedBox(height: 55.h),
                  AppTextField(
                    labelText: "Email",
                    obscureText: false,
                    controller: emailController,
                    prefixIcon: Icons.email,
                    showSuffixIcon: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                          .hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 150.h),
                  SizedBox(
                    width: double.infinity,
                    child: AppCustomBtn(
                      color: AppColors.mainColor,
                      text: "Reset Password",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuthFunctions.resetPassword(
                              emailController.text);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor:
                                      AppColors.scaffoldBackgroundColor,
                                  title: Text(
                                    "Reset password",
                                    style: AppTextStyles.roboto18RedColor500,
                                  ),
                                  content: Text(
                                    "Reset password link sent to your email,\nCheck your email Inbox",
                                    style: AppTextStyles.roboto14BlackColor700,
                                  ),
                                  actions: [
                                    GestureDetector(
                                        onTap: () {
                                          context
                                              .pushReplacementNamed("/SignIn");
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: AppTextStyles
                                              .roboto20MainColor700,
                                        ))
                                  ],
                                );
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
