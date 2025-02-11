// ignore_for_file: must_be_immutable

import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPlayerModel extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? age;

  const NewPlayerModel({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushNamed("/PlayerInfo");
      },
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 30.r,
              backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
                  ? NetworkImage(imageUrl!)
                  : null,
              child: imageUrl == null || imageUrl!.isEmpty
                  ? Icon(Icons.person, size: 30.sp, color: AppColors.greyColor)
                  : null,
            ),
            SizedBox(width: 18.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name ?? "Player Name",
                    style: AppTextStyles.roboto16MainColor700),
                Text("$age y.o", style: AppTextStyles.roboto12MainColor500),
              ],
            ),
            const Spacer(),
            Icon(Icons.account_circle_rounded,
                size: 30.sp, color: AppColors.greyColor),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
