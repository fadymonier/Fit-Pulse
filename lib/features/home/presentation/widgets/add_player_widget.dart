import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPlayerWidget extends StatelessWidget {
  const AddPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.mainColor, width: 2.w),
          borderRadius: BorderRadius.circular(17.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 24.w,
          ),
          Text(
            "Add Player",
            style: AppTextStyles.roboto16MainColor700
                .copyWith(fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Icon(
            Icons.add_circle_outline,
            color: AppColors.mainColor,
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }
}
