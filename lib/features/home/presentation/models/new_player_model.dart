import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/features/player_info/presentation/screens/added_player_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPlayerModel extends StatelessWidget {
  final ImageProvider<Object>? imageProvider;
  final String? name;
  final String? age;
  final String? imagePath;

  const NewPlayerModel({
    super.key,
    required this.imageProvider,
    required this.name,
    required this.age,
    required this.imagePath,
    String? imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddedPlayerInfo(
              imagePath: imagePath ?? "assets/images/default_avatar.png",
              name: name ?? 'Salah',
              phone: '+21235458564',
              age: age ?? '30',
              couch: 'Guardiola',
              weight: '80',
              height: '180',
              lacticAcid: '0.1',
              city: 'Liverpool',
            ),
          ),
        );
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
              backgroundImage: imageProvider,
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
