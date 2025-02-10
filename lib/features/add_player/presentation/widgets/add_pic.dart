import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPicWidget extends StatefulWidget {
  final Function(File) onImageSelected;

  const AddPicWidget({super.key, required this.onImageSelected});

  @override
  AddPicWidgetState createState() => AddPicWidgetState();
}

class AddPicWidgetState extends State<AddPicWidget> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        _image = imageFile;
      });

      widget.onImageSelected(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 150.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(100.r),
          image: _image != null
              ? DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _image == null
            ? Icon(
                Icons.note_add,
                size: 40.sp,
                color: AppColors.darkGreyColor,
              )
            : null,
      ),
    );
  }
}
