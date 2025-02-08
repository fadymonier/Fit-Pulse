import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("/PlayerInfo");
      },
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(17.r)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 60.w,
              height: 60.h,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/marmoush.png"),
              ),
            ),
            SizedBox(
              width: 18.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Omar Marmoush",
                  style: AppTextStyles.roboto16MainColor700,
                ),
                Text(
                  "25 y.o",
                  style: AppTextStyles.roboto12MainColor500,
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.account_circle_rounded,
              size: 30.sp,
              color: AppColors.greyColor,
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
