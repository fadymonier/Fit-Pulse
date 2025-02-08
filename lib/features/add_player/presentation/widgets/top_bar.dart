import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pushReplacementNamed("/Home"),
          child: Image.asset(
              height: 80.h, width: 80.w, "assets/images/backContainer.png"),
        ),
        SizedBox(
          width: 47.w,
        ),
        Align(
          alignment: Alignment.center,
          child: AppTitle(
              title: "Add Player",
              showDivider: false,
              textStyle: AppTextStyles.roboto24MainColor700),
        ),
      ],
    );
  }
}
