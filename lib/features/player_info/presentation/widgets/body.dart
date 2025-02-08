import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/player_card_details_model.dart';

class PlayerInfoScreenBody extends StatelessWidget {
  const PlayerInfoScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(24.0.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              title: 'Player Info',
              showDivider: true,
              textStyle: AppTextStyles.roboto24MainColor700,
            ),
            SizedBox(
              height: 67.h,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 160.w,
                height: 160.h,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/marmoush.png"),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.person),
              title: 'name',
              content: 'Omar Marmoush',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.call),
              title: 'phone',
              content: '+201286952813',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.calendar_month),
              title: 'Age',
              content: '23',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.badge),
              title: 'Couch',
              content: 'hassan shehata',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(
                  color: AppColors.greyColor, Icons.monitor_weight_rounded),
              title: 'weight ( kg )',
              content: '80 ',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.straighten),
              title: 'height  ( cm )',
              content: '180  ',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.medical_services),
              title: 'lactic-acid',
              content: '50',
            ),
            SizedBox(
              height: 18.h,
            ),
            PlayerDetailsModel(
              icon: Icon(color: AppColors.greyColor, Icons.location_on_sharp),
              title: 'city',
              content: 'Cairo ',
            ),
            SizedBox(
              height: 18.h,
            ),
          ],
        ),
      ),
    ));
  }
}
