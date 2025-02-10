import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/features/auth/signin/presentation/widgets/signin_bar.dart';
import 'package:fitpulse/firebase/functions/firebase_auth_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/widgets/custom_btn.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  SigninScreenState createState() => SigninScreenState();
}

class SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      FirebaseAuthFunctions.signIn(
        emailController.text,
        passwordController.text,
        () => const Center(child: CircularProgressIndicator()),
        () {
          setState(() => isLoading = false);
          context.pushReplacementNamed("/Home");
        },
        (error) {
          setState(() => isLoading = false);
          _showErrorDialog(error.toString());
        },
      );
    }
  }

  void _showErrorDialog(String error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          title: Text("Something went wrong",
              style: AppTextStyles.roboto18RedColor500),
          content: Text(error, style: AppTextStyles.roboto14BlackColor700),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  Text("Try Again", style: AppTextStyles.roboto20MainColor700),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28.0.r),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const SigninBar(),
                  SizedBox(height: 75.h),
                  AppTitle(
                    title: "Welcome Back Coach,",
                    showDivider: false,
                    textStyle: AppTextStyles.roboto24MainColor700,
                  ),
                  SizedBox(height: 14.h),
                  Text("Nice to see you again.",
                      style: AppTextStyles.roboto16GreyColor700),
                  SizedBox(height: 75.h),
                  AppTextField(
                    labelText: "Username",
                    obscureText: false,
                    controller: emailController,
                    prefixIcon: CupertinoIcons.person_fill,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Username is required'
                        : null,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 34.h),
                  AppTextField(
                    labelText: "Password",
                    obscureText: true,
                    controller: passwordController,
                    showSuffixIcon: true,
                    prefixIcon: CupertinoIcons.lock_fill,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.pushNamed("/ForgetPassword"),
                      child: Text("Forget Password?",
                          style: AppTextStyles.roboto16GreyColor700),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    width: double.infinity,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ))
                        : AppCustomBtn(
                            color: AppColors.mainColor,
                            onPressed: _handleLogin,
                            text: "Login",
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
