import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static final roboto20MainColor700 = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.mainColor,
  );
  static final roboto24MainColor700 = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.mainColor,
  );
  static final roboto14BlackColor700 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static final roboto14BlackColor400 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
  static final roboto16GreyColor700 = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.greyColor,
  );
  static final roboto14GreyColor400 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
  static final buttonTextStyle = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.whiteColor,
  );
  static final errorTextStyle = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );
}
