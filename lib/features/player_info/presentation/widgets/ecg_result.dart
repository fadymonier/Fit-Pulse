import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECGResultWidget extends StatelessWidget {
  String status = "Loading";
  String? percentage;
  ECGResultWidget({
    super.key,
    required this.status,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.lightGreenColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                    title: "ECG Result",
                    showDivider: true,
                    textStyle: AppTextStyles.roboto20MainColor700),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  percentage ?? "100%",
                  style: AppTextStyles.roboto20BlackColor700,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.greyColor,
                  size: 37.sp,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
