import 'package:fitpulse/core/extensions/extensions.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/acceleration.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/ecg_result.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/fl_chart.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/lactic_acid_level.dart';
import 'package:fitpulse/features/player_info/presentation/widgets/state_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class PlayerStatstics extends StatefulWidget {
  const PlayerStatstics({super.key});

  @override
  State<PlayerStatstics> createState() => _PlayerStatsticsState();
}

class _PlayerStatsticsState extends State<PlayerStatstics> {
  double _lacticAcidValue = 0.1;

  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  Stream<int> get _ecgSignalStream => _databaseRef
      .child('ECG_Signal')
      .onValue
      .map((event) => event.snapshot.value as int? ?? 0);
  Stream<int> get _heartRateStream => _databaseRef
      .child('HeartRate_BPM')
      .onValue
      .map((event) => event.snapshot.value as int? ?? 0);
  Stream<int> get _piezoKnockCountStream => _databaseRef
      .child('Piezo_Knock_Count')
      .onValue
      .map((event) => event.snapshot.value as int? ?? 0);
  Stream<int> get _heartRatePercentageStream =>
      _databaseRef.child('HeartRate_Status').onValue.map((event) {
        final value = event.snapshot.value.toString();
        return int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      });

  @override
  void initState() {
    super.initState();
    _loadLacticAcidValue();
  }

  Future<void> _loadLacticAcidValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lacticAcidValue = prefs.getDouble('lactic_acid') ?? 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pushReplacementNamed("/Home"),
                    child: Image.asset(
                      height: 80.h,
                      width: 80.w,
                      "assets/images/backContainer.png",
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SizedBox(
                    width: 280.w,
                    height: 70.w,
                    child: Image.asset("assets/images/marmoushContainer.png"),
                  ),
                ],
              ),
              StreamBuilder<int>(
                stream: _ecgSignalStream,
                builder: (context, snapshot) {
                  return ECGChartWidget(number: snapshot.data ?? 500);
                },
              ),
              SizedBox(height: 20.h),
              StreamBuilder<int>(
                stream: _heartRatePercentageStream,
                builder: (context, snapshot) {
                  return ECGResultWidget(
                    status: 'Loading',
                    percentage: snapshot.data?.toString() ?? '0',
                  );
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder<int>(
                    stream: _heartRateStream,
                    builder: (context, snapshot) {
                      return StateCards(
                          title: "Heart Rate",
                          value: "${snapshot.data ?? 0} BPM",
                          imagePath: "assets/images/heart.png");
                    },
                  ),
                  DistanceWidget(),
                ],
              ),
              SizedBox(height: 15.h),
              LacticAcidLevelWidget(
                  lacticAcidValue: _lacticAcidValue,
                  piezoKnockCountStream: _piezoKnockCountStream),
              SizedBox(height: 8.h),
              AccelerationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
