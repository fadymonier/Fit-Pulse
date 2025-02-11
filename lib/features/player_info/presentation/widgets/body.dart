// ignore_for_file: use_build_context_synchronously

import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:fitpulse/features/player_info/presentation/models/player_card_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerInfoScreenBody extends StatefulWidget {
  const PlayerInfoScreenBody({super.key});

  @override
  State<PlayerInfoScreenBody> createState() => _PlayerInfoScreenBodyState();
}

class _PlayerInfoScreenBodyState extends State<PlayerInfoScreenBody> {
  final TextEditingController _lacticAcidController = TextEditingController();
  double _lacticAcidValue = 0.1;

  @override
  void initState() {
    super.initState();
    _loadLacticAcidValue();
  }

  Future<void> _loadLacticAcidValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lacticAcidValue = prefs.getDouble('lactic_acid') ?? 0.1;
      _lacticAcidController.text = _lacticAcidValue.toString();
    });
  }

  Future<void> _saveLacticAcidValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('lactic_acid', _lacticAcidValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: 'Player Info',
                showDivider: true,
                textStyle: AppTextStyles.roboto24MainColor700,
              ),
              SizedBox(height: 67.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 160.w,
                  height: 160.h,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/marmoush.png"),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              PlayerDetailsModel(
                icon: Icon(color: AppColors.greyColor, Icons.person),
                title: 'name',
                content: 'Omar Marmoush',
              ),
              SizedBox(height: 18.h),
              PlayerDetailsModel(
                icon: Icon(color: AppColors.greyColor, Icons.call),
                title: 'phone',
                content: '+201286952813',
              ),
              SizedBox(height: 18.h),
              PlayerDetailsModel(
                icon: Icon(color: AppColors.greyColor, Icons.calendar_month),
                title: 'Age',
                content: '23',
              ),
              SizedBox(height: 18.h),
              PlayerDetailsModel(
                icon: Icon(color: AppColors.greyColor, Icons.badge),
                title: 'Couch',
                content: 'Hassan Shehata',
              ),
              SizedBox(height: 18.h),
              PlayerDetailsModel(
                icon: Icon(
                    color: AppColors.greyColor, Icons.monitor_weight_rounded),
                title: 'weight ( kg )',
                content: '80',
              ),
              SizedBox(height: 18.h),
              PlayerDetailsModel(
                icon: Icon(color: AppColors.greyColor, Icons.straighten),
                title: 'height  ( cm )',
                content: '180',
              ),
              SizedBox(height: 18.h),
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                            color: AppColors.greyColor, Icons.medical_services),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'lactic-acid',
                        style: AppTextStyles.roboto16GreyColor700,
                      ),
                      SizedBox(width: 150.w),
                      Expanded(
                        child: TextFormField(
                          style: AppTextStyles.roboto14BlackColor700,
                          controller: _lacticAcidController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'value',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.r),
                              borderSide:
                                  BorderSide(color: AppColors.greyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.r),
                              borderSide: BorderSide(
                                  color: AppColors.mainColor, width: 2.0),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.r),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _lacticAcidValue = double.tryParse(value) ?? 0.1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              PlayerDetailsModel(
                icon: Icon(color: AppColors.greyColor, Icons.location_on_sharp),
                title: 'city',
                content: 'Cairo',
              ),
              SizedBox(height: 26.h),
              AppCustomBtn(
                color: AppColors.mainColor,
                text: "Confirm Changes",
                onPressed: () async {
                  await _saveLacticAcidValue();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Lactic Acid value saved successfully!")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _lacticAcidController.dispose();
    super.dispose();
  }
}
