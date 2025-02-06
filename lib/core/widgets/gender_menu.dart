import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderMenu extends StatelessWidget {
  final String? selectedGender;
  final Function(String?) onChanged;

  const GenderMenu({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 12.r),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: DropdownButtonFormField<String>(
          value: selectedGender,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteColor,
            labelText: "Gender",
            labelStyle: AppTextStyles.roboto16GreyColor700,
            prefixIcon:
                Icon(Icons.account_circle_rounded, color: AppColors.greyColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
          ),
          dropdownColor: AppColors.whiteColor,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.greyColor),
          items: ["Male", "Female"]
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child:
                        Text(gender, style: AppTextStyles.roboto14GreyColor400),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
