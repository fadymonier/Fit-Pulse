import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StateCards extends StatelessWidget {
  const StateCards({
    super.key,
    required this.title,
    required this.value,
    required this.imagePath,
  });

  final String title;
  final String value;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(width: 180.w, imagePath),
          Padding(
            padding: EdgeInsets.all(24.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                    title: title,
                    showDivider: true,
                    textStyle: AppTextStyles.roboto16MainColor700),
                SizedBox(height: 10.h),
                Text(value, style: AppTextStyles.roboto14BlackColor700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
