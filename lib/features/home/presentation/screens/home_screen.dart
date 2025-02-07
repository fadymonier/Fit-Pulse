import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/features/home/presentation/widgets/add_player_widget.dart';
import 'package:fitpulse/features/home/presentation/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
            title: "Select Player",
            showDivider: false,
            textStyle: AppTextStyles.roboto20MainColor700),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0.r),
        child: Column(
          children: [
            PlayerCard(),
            SizedBox(height: 26.h),
            AddPlayerWidget(),
          ],
        ),
      ),
    );
  }
}
