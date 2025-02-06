import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBodyWidget extends StatelessWidget {
  const TextBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lorem ipsum",
          style: AppTextStyles.roboto14BlackColor700,
        ),
        Text(
          "Lorem ipsum dolor sit amet consectetur. Netus\nfringilla parturient elit consectetur. In molestie\nbibendum a enim magnis nisl pellentesque.\nElementum amet quis libero blandit et nunc risus sit.\nDolor ullamcorper nam suspendisse in in nisl. Augue\npellentesque accumsan pharetra et felis nunc mi\nsollicitudin. Eu porta pharetra elit blandit aliquam eu\ncommodo egestas. Vel id leo ultricies lacinia vitae.",
          style: AppTextStyles.roboto14BlackColor400,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Lorem ipsum",
          style: AppTextStyles.roboto14BlackColor700,
        ),
        Text(
          "Lorem ipsum dolor sit amet consectetur. Netus\nfringilla parturient elit consectetur. In molestie\nbibendum a enim magnis nisl pellentesque.\nElementum amet quis libero blandit et nunc risus sit.\nDolor ullamcorper nam suspendisse in in nisl. Augue\npellentesque accumsan pharetra et felis nunc mi\nsollicitudin. Eu porta pharetra elit blandit aliquam eu\ncommodo egestas. Vel id leo ultricies lacinia vitae.",
          style: AppTextStyles.roboto14BlackColor400,
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 70.h,
        ),
        SizedBox(
          width: double.infinity,
          child: AppCustomBtn(
            color: AppColors.mainColor,
            text: "Get Started",
            onPressed: () {
              context.pushReplacementNamed("/SignIn");
            },
          ),
        )
      ],
    );
  }
}
