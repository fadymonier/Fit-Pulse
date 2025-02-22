import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'dart:math';
import 'dart:collection';

class ECGChartWidget extends StatefulWidget {
  final int number;

  const ECGChartWidget({super.key, required this.number});

  @override
  ECGChartWidgetState createState() => ECGChartWidgetState();
}

class ECGChartWidgetState extends State<ECGChartWidget>
    with WidgetsBindingObserver {
  final Queue<FlSpot> spots = Queue<FlSpot>();
  Timer? _timer;
  double xValue = 0;
  final Random random = Random();
  static const int visibleRange = 50;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startLiveUpdate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _timer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _startLiveUpdate();
    }
  }

  void _startLiveUpdate() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!mounted) return;

      double yValue =
          widget.number + sin(xValue * 0.1) * 20 + random.nextDouble() * 10;

      setState(() {
        spots.add(FlSpot(xValue, yValue));
        xValue++;

        if (spots.length > visibleRange) {
          spots.removeFirst();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.h,
      child: Card(
        elevation: 5,
        color: AppColors.whiteColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppTitle(
                    title: "ECG",
                    showDivider: true,
                    textStyle: AppTextStyles.roboto20MainColor700,
                  ),
                  const Spacer(),
                  Text(
                    "${widget.number} POINTS",
                    style: AppTextStyles.roboto14BlackColor700,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: LineChart(
                  LineChartData(
                    minX: max(0, xValue - visibleRange.toDouble()),
                    maxX: xValue,
                    gridData: const FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: max(1.0, widget.number / 5),
                          reservedSize: 50,
                          getTitlesWidget: (value, meta) {
                            if (value < widget.number / 6) return Container();
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 6.0, bottom: 4.0),
                              child: Text(
                                value >= 1000
                                    ? '${(value / 1000).toStringAsFixed(1)}K'
                                    : value.toInt().toString(),
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: EdgeInsets.only(top: 4.0.r),
                              child: Text(value.toInt().toString(),
                                  style: TextStyle(fontSize: 12.sp)),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots.toList(),
                        isCurved: true,
                        color: AppColors.mainColor,
                        barWidth: 2.w,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
