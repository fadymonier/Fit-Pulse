import 'package:fitpulse/core/cache/cache_helper.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AddPicWidget extends StatefulWidget {
  final Function(String) onImageSelected; // تعديل لاستقبال المسار بدلًا من ملف

  const AddPicWidget({super.key, required this.onImageSelected});

  @override
  AddPicWidgetState createState() => AddPicWidgetState();
}

class AddPicWidgetState extends State<AddPicWidget> {
  String? _imagePath;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final savedPath = await _saveImageLocally(File(pickedFile.path));

      setState(() {
        _imagePath = savedPath;
      });

      widget.onImageSelected(savedPath);
    }
  }

  Future<String> _saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final localPath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    final savedImage = await imageFile.copy(localPath);
    await SharedPrefHelper.setData('imagePath', savedImage.path);
    return savedImage.path;
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
          image: _imagePath != null
              ? DecorationImage(
                  image: FileImage(File(_imagePath!)),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _imagePath == null
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
