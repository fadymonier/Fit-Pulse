// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:typed_data';
import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fitpulse/features/home/presentation/models/new_player_model.dart';
import 'package:fitpulse/features/home/presentation/widgets/add_player_widget.dart';
import 'package:fitpulse/features/home/presentation/widgets/player_card.dart';
import 'package:fitpulse/firebase/functions/firebase_auth_functions.dart';
import 'package:fitpulse/firebase/functions/firebase_data_functions.dart';
import 'package:fitpulse/firebase/models/add_player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSigningOut = false;

  /// Convert Base64 string to Uint8List for displaying the image
  Uint8List? _decodeBase64Image(String base64String) {
    try {
      return base64Decode(base64String);
    } catch (e) {
      print("❌ Error decoding Base64: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _isSigningOut ? null : () => _showLogoutDialog(context),
            icon: Icon(Icons.logout_rounded, color: AppColors.mainColor),
          ),
          SizedBox(width: 8.w)
        ],
        automaticallyImplyLeading: false,
        title: AppTitle(
          title: "Select Player",
          showDivider: false,
          textStyle: AppTextStyles.roboto20MainColor700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0.r),
        child: Column(
          children: [
            PlayerCard(),
            SizedBox(height: 26.h),
            FutureBuilder(
              future: FirebaseDataFunctions.getPlayersData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child:
                        CircularProgressIndicator(color: AppColors.mainColor),
                  );
                }
                if (snapshot.hasError) {
                  return Text("Something went wrong",
                      style: AppTextStyles.errorTextStyle);
                }

                List<AddPlayerDataModel> playersList =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 26.h),
                  itemCount: playersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Uint8List? playerImage = playersList[index].imageUrl != null
                        ? _decodeBase64Image(playersList[index].imageUrl!)
                        : null;

                    return NewPlayerModel(
                      imageUrl: playerImage != null
                          ? base64Encode(playerImage)
                          : null,
                      name: playersList[index].name,
                      age: playersList[index].age,
                    );
                  },
                );
              },
            ),
            SizedBox(height: 26.h),
            AddPlayerWidget(),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: !_isSigningOut,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.scaffoldBackgroundColor,
              title: Text("Logout", style: AppTextStyles.roboto24MainColor700),
              content: _isSigningOut
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Signing out...",
                            style: AppTextStyles.roboto20BlackColor700),
                        SizedBox(height: 20.h),
                        CircularProgressIndicator(color: AppColors.mainColor),
                      ],
                    )
                  : Text("Are you sure?",
                      style: AppTextStyles.roboto20BlackColor700),
              actions: _isSigningOut
                  ? []
                  : [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No",
                            style: AppTextStyles.roboto18BlackColor500),
                      ),
                      TextButton(
                        onPressed: () async {
                          setState(() => _isSigningOut = true);
                          await FirebaseAuthFunctions.signOut();
                          if (mounted) {
                            Navigator.pop(context);
                            context.pushReplacementNamed("/SignIn");
                          }
                        },
                        child: Text("Yes",
                            style: AppTextStyles.roboto18RedColor500),
                      ),
                    ],
            );
          },
        );
      },
    );
  }
}
