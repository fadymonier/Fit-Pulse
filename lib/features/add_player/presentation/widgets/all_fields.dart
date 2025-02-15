// ignore_for_file: must_be_immutable

import 'package:fitpulse/core/widgets/app_textfield.dart';
import 'package:fitpulse/core/widgets/gender_menu.dart';
import 'package:flutter/material.dart';

class AllFieldsWidget extends StatefulWidget {
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController ageController;
  TextEditingController coachController;
  TextEditingController weightController;
  TextEditingController heightController;
  TextEditingController lacticAcidController;
  TextEditingController cityController;
  String selectedGender;

  AllFieldsWidget({
    super.key,
    required this.nameController,
    required this.selectedGender,
    required this.phoneController,
    required this.ageController,
    required this.coachController,
    required this.weightController,
    required this.heightController,
    required this.lacticAcidController,
    required this.cityController,
  });

  @override
  State<AllFieldsWidget> createState() => _AllFieldsWidgetState();
}

class _AllFieldsWidgetState extends State<AllFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          labelText: "Name",
          obscureText: false,
          controller: widget.nameController,
          prefixIcon: Icons.person,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a name";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        GenderMenu(
          selectedGender: widget.selectedGender,
          onChanged: (value) {
            setState(() {
              widget.selectedGender = value!;
            });
          },
        ),
        AppTextField(
          labelText: "Phone",
          obscureText: false,
          controller: widget.phoneController,
          prefixIcon: Icons.call,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a phone number";
            } else if (value.length != 11) {
              return "Phone number must be 11 digits";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        AppTextField(
          labelText: "Age",
          obscureText: false,
          controller: widget.ageController,
          prefixIcon: Icons.calendar_month,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter age";
            } else if (int.tryParse(value) == null) {
              return "Age must be a number";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        AppTextField(
          labelText: "Coach",
          obscureText: false,
          controller: widget.coachController,
          prefixIcon: Icons.badge,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter coach name";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        AppTextField(
          labelText: "Weight (kg)",
          obscureText: false,
          controller: widget.weightController,
          prefixIcon: Icons.monitor_weight_rounded,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter weight";
            } else if (double.tryParse(value) == null) {
              return "Weight must be a number";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        AppTextField(
          labelText: "Height (cm)",
          obscureText: false,
          controller: widget.heightController,
          prefixIcon: Icons.straighten,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter height";
            } else if (double.tryParse(value) == null) {
              return "Height must be a number";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        AppTextField(
          labelText: "Lactic Acid Level",
          obscureText: false,
          controller: widget.lacticAcidController,
          prefixIcon: Icons.medical_services,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter lactic acid level";
            } else if (double.tryParse(value) == null) {
              return "Lactic acid level must be a number";
            }
            return null;
          },
          onChanged: (_) {},
        ),
        AppTextField(
          labelText: "City",
          obscureText: false,
          controller: widget.cityController,
          prefixIcon: Icons.location_on_sharp,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a city";
            }
            return null;
          },
          onChanged: (_) {},
        ),
      ],
    );
  }
}
