import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/player_statstics.dart';

class PlayerInfoScreen extends StatefulWidget {
  const PlayerInfoScreen({super.key});

  @override
  State<PlayerInfoScreen> createState() => _PlayerInfoScreenState();
}

class _PlayerInfoScreenState extends State<PlayerInfoScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PlayerInfoScreenBody(), // ------------------------------------------------------------------------------
    PlayerStatstics(), // -----------------------------------------------------------------------------------
  ];

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
    bool isSelected = _selectedIndex == index;
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
