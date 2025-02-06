import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninBar extends StatelessWidget {
  const SigninBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Image.asset("assets/images/signInTabBar.png"),
        GestureDetector(
          onTap: () {
            context.pushNamed("/Register");
          },
          child: Container(
            height: 50.h,
            width: 170.w,
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}
