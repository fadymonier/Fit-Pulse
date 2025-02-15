// ignore_for_file: must_be_immutable

import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerDetailsModel extends StatelessWidget {
  Icon icon;
  String title;
  String content;
  PlayerDetailsModel(
      {super.key,
      required this.icon,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.w,
          ),
          icon,
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.roboto16GreyColor700,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                content,
                style: AppTextStyles.roboto14BlackColor700,
              )
            ],
          )
        ],
      ),
    );
  }
}
