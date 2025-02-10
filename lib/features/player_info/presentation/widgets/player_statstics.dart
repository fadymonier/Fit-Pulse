import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/ecg_result.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerStatstics extends StatelessWidget {
  const PlayerStatstics({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(24.0.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.pushReplacementNamed("/Home"),
                  child: Image.asset(
                      height: 80.h,
                      width: 80.w,
                      "assets/images/backContainer.png"),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                    width: 280.w,
                    height: 70.w,
                    child: Image.asset("assets/images/marmoushContainer.png"))
              ],
            ),
            ECGChartWidget(number: 50),
            SizedBox(
              height: 20.h,
            ),
            ECGResultWidget(),
            SizedBox(
              height: 20.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Stack(
                children: [
                  Image.asset(width: 180.w, "assets/images/heart.png"),
                  Padding(
                    padding: EdgeInsets.all(24.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                            title: "Heart Rate",
                            showDivider: true,
                            textStyle: AppTextStyles.roboto16MainColor700),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "50 RBM",
                          style: AppTextStyles.roboto14BlackColor700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image.asset(width: 180.w, "assets/images/speed.png"),
                  Padding(
                    padding: EdgeInsets.all(24.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                            title: "Speed",
                            showDivider: true,
                            textStyle: AppTextStyles.roboto16MainColor700),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "50 m/h",
                          style: AppTextStyles.roboto14BlackColor700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 15.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Stack(
                children: [
                  Image.asset(width: 180.w, "assets/images/lactic.png"),
                  Padding(
                    padding: EdgeInsets.all(24.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                            title: "Lactic-Acid",
                            showDivider: true,
                            textStyle: AppTextStyles.roboto16MainColor700),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "50",
                          style: AppTextStyles.roboto14BlackColor700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image.asset(width: 180.w, "assets/images/breath.png"),
                  Padding(
                    padding: EdgeInsets.all(24.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                            title: "Breath",
                            showDivider: true,
                            textStyle: AppTextStyles.roboto16MainColor700),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "50",
                          style: AppTextStyles.roboto14BlackColor700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    ));
  }
}
