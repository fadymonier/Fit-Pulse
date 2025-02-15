// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';
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
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSigningOut = false;
  bool _isRefreshing = false;
  List<AddPlayerDataModel> _playersList = [];

  @override
  void initState() {
    super.initState();
    _fetchPlayers();
  }

  /// Fetch player data from Firebase
  Future<void> _fetchPlayers() async {
    setState(() => _isRefreshing = true);
    try {
      var snapshot = await FirebaseDataFunctions.getPlayersData();
      setState(() {
        _playersList = snapshot.docs.map((e) => e.data()).toList();
      });
    } catch (e) {
      print("❌ Error fetching players: $e");
    }
    setState(() => _isRefreshing = false);
  }

  /// Delete player and refresh the list
  Future<void> _deletePlayer(String playerId, String? imagePath) async {
    await FirebaseDataFunctions.deletePlayer(playerId, imagePath);
    _fetchPlayers();
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
      body: RefreshIndicator(
        onRefresh: _fetchPlayers,
        color: AppColors.mainColor,
        child: Padding(
          padding: EdgeInsets.all(22.0.r),
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              PlayerCard(),
              SizedBox(height: 26.h),
              if (_isRefreshing)
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 26.h),
                  itemCount: _playersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    String? imagePath = _playersList[index].imageUrl;
                    ImageProvider imageProvider;

                    if (imagePath != null && imagePath.isNotEmpty) {
                      File file = File(imagePath);
                      if (file.existsSync()) {
                        imageProvider = FileImage(file);
                      } else {
                        print("⚠️ Image not found at path: $imagePath");
                        imageProvider =
                            AssetImage("assets/images/default_avatar.png");
                      }
                    } else {
                      imageProvider =
                          AssetImage("assets/images/default_avatar.png");
                    }

                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: .35.w,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (_) => _deletePlayer(
                                _playersList[index].id!, imagePath),
                            backgroundColor: AppColors.errorColor,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r),
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      child: NewPlayerModel(
                        imageProvider: imageProvider,
                        name: _playersList[index].name,
                        age: _playersList[index].age,
                        imageUrl: _playersList[index].imageUrl,
                        imagePath: imagePath,
                      ),
                    );
                  },
                ),
              SizedBox(height: 26.h),
              AddPlayerWidget(),
            ],
          ),
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
