import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomBtn extends StatelessWidget {
  const AppCustomBtn(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed});
  final Color color;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: Text(text, style: AppTextStyles.buttonTextStyle),
      ),
    );
  }
}
