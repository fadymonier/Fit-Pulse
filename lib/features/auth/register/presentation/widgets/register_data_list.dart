import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:fitpulse/core/widgets/gender_menu.dart';
import 'package:fitpulse/firebase/functions/firebase_auth_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterDataList extends StatefulWidget {
  const RegisterDataList({super.key});

  @override
  RegisterDataListState createState() => RegisterDataListState();
}

class RegisterDataListState extends State<RegisterDataList> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool passwordsMatch = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      FirebaseAuthFunctions.createAccount(
        userName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        gender: 'Male',
        onSuccess: () {
          setState(() {
            isLoading = false;
          });
          context.pushReplacementNamed("/SignIn");
        },
        onError: (error) {
          setState(() {
            isLoading = false;
          });
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: AppColors.scaffoldBackgroundColor,
                title: Text(
                  "Something went wrong",
                  style: AppTextStyles.roboto18RedColor500,
                ),
                content: Text(
                  error.toString(),
                  style: AppTextStyles.roboto14BlackColor700,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Try Again",
                      style: AppTextStyles.roboto20MainColor700,
                    ),
                  ),
                ],
              );
            },
          );
        },
        name: nameController.text,
        onLoading: () {},
      );
    }
  }

  void _validatePasswords() {
    setState(() {
      passwordsMatch =
          passwordController.text == confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                labelText: "Name",
                obscureText: false,
                controller: nameController,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              SizedBox(height: 18.h),
              AppTextField(
                labelText: "Email",
                obscureText: false,
                controller: emailController,
                prefixIcon: Icons.account_circle_rounded,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              SizedBox(height: 18.h),
              GenderMenu(selectedGender: "Male", onChanged: (value) {}),
              SizedBox(height: 18.h),
              AppTextField(
                labelText: "Phone",
                obscureText: false,
                controller: phoneController,
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number is required";
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              SizedBox(height: 18.h),
              AppTextField(
                labelText: "Password",
                obscureText: true,
                showSuffixIcon: true,
                controller: passwordController,
                prefixIcon: CupertinoIcons.lock_fill,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (_) => _validatePasswords(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 18.h),
              AppTextField(
                labelText: "Confirm Password",
                obscureText: true,
                showSuffixIcon: true,
                controller: confirmPasswordController,
                prefixIcon: CupertinoIcons.lock_fill,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (_) => _validatePasswords(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm Password is required";
                  }
                  return null;
                },
                borderColor: passwordsMatch ? null : Colors.red,
              ),
              if (!passwordsMatch)
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    "Passwords do not match",
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                ),
              SizedBox(height: 18.h),
              SizedBox(
                width: double.infinity,
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ),
                      )
                    : AppCustomBtn(
                        color: AppColors.mainColor,
                        text: "Register Now",
                        onPressed: _handleRegister,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
