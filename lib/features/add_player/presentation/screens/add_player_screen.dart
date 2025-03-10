// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/widgets/custom_btn.dart';
import 'package:fitpulse/features/add_player/presentation/widgets/add_pic.dart';
import 'package:fitpulse/features/add_player/presentation/widgets/all_fields.dart';
import 'package:fitpulse/features/add_player/presentation/widgets/top_bar.dart';
import 'package:fitpulse/firebase/functions/firebase_data_functions.dart';
import 'package:fitpulse/firebase/models/add_player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({super.key});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController coachController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController lacticAcidController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? selectedImagePath;
  String selectedGender = "Male";
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    coachController.dispose();
    weightController.dispose();
    heightController.dispose();
    lacticAcidController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _handleImageSelected(String imagePath) {
    setState(() {
      selectedImagePath = imagePath;
    });
  }

  void _submitData() async {
    if (selectedImagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('❌ Please select an image!'),
            backgroundColor: Colors.red),
      );
      return;
    }

    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('❌ Fill in all fields!'),
            backgroundColor: Colors.red),
      );
      return;
    }

    _formKey.currentState!.save();
    setState(() => isLoading = true);

    AddPlayerDataModel addPlayerDataModel = AddPlayerDataModel(
      name: nameController.text,
      gender: selectedGender,
      phone: phoneController.text,
      age: ageController.text,
      coach: coachController.text,
      weight: weightController.text,
      height: heightController.text,
      imageUrl: selectedImagePath!,
      lacticAcid: lacticAcidController.text,
      city: cityController.text,
      userId: FirebaseAuth.instance.currentUser!.uid,
    );

    await FirebaseDataFunctions.addPlayerData(
        addPlayerDataModel, File(selectedImagePath!));
    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('✅ Player added successfully!'),
          backgroundColor: Colors.green),
    );

    context.pushReplacementNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopBar(),
                  SizedBox(height: 45.h),
                  AddPicWidget(onImageSelected: _handleImageSelected),
                  SizedBox(height: 30.h),
                  AllFieldsWidget(
                    nameController: nameController,
                    selectedGender: selectedGender,
                    phoneController: phoneController,
                    ageController: ageController,
                    coachController: coachController,
                    weightController: weightController,
                    heightController: heightController,
                    lacticAcidController: lacticAcidController,
                    cityController: cityController,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ))
                        : AppCustomBtn(
                            color: AppColors.mainColor,
                            text: "Confirm Data",
                            onPressed: _submitData),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
