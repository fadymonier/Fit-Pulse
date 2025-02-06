import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBar extends StatelessWidget {
  const RegisterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset("assets/images/registerTabBar.png"),
        GestureDetector(
          onTap: () {
            context.pushNamed("/SignIn");
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
