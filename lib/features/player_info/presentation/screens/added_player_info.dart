// ignore_for_file: must_be_immutable

import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/added_player/added_player_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/marmoush/player_statstics.dart';

class AddedPlayerInfo extends StatefulWidget {
  final String? imagePath;
  final String name;
  final String phone;
  final String age;
  final String couch;
  final String weight;
  final String height;
  final String lacticAcid;
  final String city;

  const AddedPlayerInfo({
    super.key,
    required this.imagePath,
    required this.name,
    required this.phone,
    required this.age,
    required this.couch,
    required this.weight,
    required this.height,
    required this.lacticAcid,
    required this.city,
  });

  @override
  State<AddedPlayerInfo> createState() => _AddedPlayerInfoState();
}

class _AddedPlayerInfoState extends State<AddedPlayerInfo> {
  int _selectedIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _initializeScreens();
  }

  void _initializeScreens() {
    _screens = [
      AddedPlayerScreenBody(
        imagePath: widget.imagePath ?? '',
        name: widget.name,
        phone: widget.phone,
        age: widget.age,
        couch: widget.couch,
        weight: widget.weight,
        height: widget.height,
        lacticAcid: widget.lacticAcid,
        city: widget.city,
      ),
      const PlayerStatstics(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _buildNavItem(Icons.person, 0),
          _buildNavItem(Icons.badge, 1),
        ],
        backgroundColor: AppColors.whiteColor,
        elevation: 10,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 7.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.mainColor),
            )
          : Icon(icon, color: AppColors.greyColor),
      label: '',
    );
  }
}
