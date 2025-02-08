import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:fitpulse/core/widgets/gender_menu.dart';
import 'package:fitpulse/features/add_player/presentation/widgets/add_pic.dart';
import 'package:fitpulse/features/add_player/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPlayerScreen extends StatelessWidget {
  const AddPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController couchController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController lacticAcidController = TextEditingController();
    TextEditingController cityController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopBar(),
                SizedBox(
                  height: 45.h,
                ),
                AddPicWidget(),
                SizedBox(
                  height: 30.h,
                ),
                AppTextField(
                    labelText: "name",
                    obscureText: false,
                    controller: nameController,
                    prefixIcon: Icons.person),
                GenderMenu(selectedGender: "Male", onChanged: (value) {}),
                AppTextField(
                    labelText: "phone",
                    obscureText: false,
                    controller: phoneController,
                    prefixIcon: Icons.call),
                AppTextField(
                    labelText: "Age",
                    obscureText: false,
                    controller: ageController,
                    prefixIcon: Icons.calendar_month),
                AppTextField(
                    labelText: "Couch",
                    obscureText: false,
                    controller: couchController,
                    prefixIcon: Icons.badge),
                AppTextField(
                    labelText: "weight ( kg )",
                    obscureText: false,
                    controller: weightController,
                    prefixIcon: Icons.monitor_weight_rounded),
                AppTextField(
                    labelText: "height  ( cm )",
                    obscureText: false,
                    controller: heightController,
                    prefixIcon: Icons.straighten),
                AppTextField(
                    labelText: "lactic-acid",
                    obscureText: false,
                    controller: lacticAcidController,
                    prefixIcon: Icons.medical_services),
                AppTextField(
                    labelText: "city",
                    obscureText: false,
                    controller: cityController,
                    prefixIcon: Icons.location_on_sharp),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppCustomBtn(
                      color: AppColors.mainColor,
                      text: "Confirm Data",
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
