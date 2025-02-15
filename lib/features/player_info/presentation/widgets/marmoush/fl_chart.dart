import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECGChartWidget extends StatefulWidget {
  final int number;

  const ECGChartWidget({super.key, required this.number});

  @override
  ECGChartWidgetState createState() => ECGChartWidgetState();
}

class ECGChartWidgetState extends State<ECGChartWidget> {
  List<FlSpot> spots = [];

  @override
  void initState() {
    super.initState();
    generateGraphData();
  }

  @override
  void didUpdateWidget(covariant ECGChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.number != widget.number) {
      generateGraphData();
    }
  }

  void generateGraphData() {
    spots = List.generate(
      10,
      (index) =>
          FlSpot(index.toDouble(), (widget.number * (index % 3)).toDouble()),
    );
    setState(() {});
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
                  Spacer(),
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
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: widget.number > 0 ? widget.number / 5 : 1,
                          reservedSize: 50,
                          getTitlesWidget: (value, meta) {
                            if (value < widget.number / 6) return Container();
                            return Padding(
                              padding: EdgeInsets.only(right: 6.0, bottom: 4.0),
                              child: Text(
                                value >= 1000
                                    ? '${(value / 1000).toStringAsFixed(1)}K'
                                    : value.toInt().toString(),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: EdgeInsets.only(top: 4.0.r),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: AppColors.mainColor,
                        barWidth: 2.w,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
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
