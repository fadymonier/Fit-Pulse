// ignore_for_file: library_private_types_in_public_api

import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final bool showSuffixIcon;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? errorText;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
    this.showSuffixIcon = false,
    this.errorText,
    required String? Function(dynamic value) validator,
    required TextInputType keyboardType,
    required void Function(dynamic _) onChanged,
    MaterialColor? borderColor,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              labelText: widget.labelText,
              labelStyle: GoogleFonts.cairo(
                color: widget.errorText == null
                    ? AppColors.greyColor
                    : AppColors.errorColor,
                fontSize: 16.sp,
              ),
              prefixIcon: Icon(widget.prefixIcon, color: AppColors.greyColor),
              enabledBorder: getBorderStyle(widget.errorText == null),
              focusedBorder: getBorderStyle(widget.errorText == null),
              errorBorder: getBorderStyle(false),
              focusedErrorBorder: getBorderStyle(false),
              suffixIcon: widget.showSuffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        color: AppColors.greyColor,
                      ),
                      onPressed: _togglePasswordVisibility,
                    )
                  : null,
            ),
          ),
          if (widget.errorText != null)
            Padding(
              padding: EdgeInsets.only(top: 4.r),
              child:
                  Text(widget.errorText!, style: AppTextStyles.errorTextStyle),
            ),
        ],
      ),
    );
  }
}

OutlineInputBorder getBorderStyle(bool isValid) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(17.r),
    borderSide: BorderSide(
        color: isValid ? AppColors.whiteColor : AppColors.errorColor, width: 2),
  );
}
