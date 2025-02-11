// ignore_for_file: deprecated_member_use

import 'package:fitpulse/features/player_info/presentation/widgets/state_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';

class AccelerationWidget extends StatefulWidget {
  const AccelerationWidget({
    super.key,
  });

  @override
  AccelerationWidgetState createState() => AccelerationWidgetState();
}

class AccelerationWidgetState extends State<AccelerationWidget> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  @override
  void initState() {
    super.initState();
    // Listen to accelerometer events
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 130.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: AppTitle(
                        title: "Acceleration",
                        showDivider: true,
                        textStyle: AppTextStyles.roboto20MainColor700),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("X: $x m/s²",
                          style: AppTextStyles.roboto14BlackColor700),
                      Text("Y: $y m/s²",
                          style: AppTextStyles.roboto14BlackColor700),
                      Text("Z: $z m/s²",
                          style: AppTextStyles.roboto14BlackColor700),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0.r),
                  child: Icon(Icons.speed_rounded,
                      size: 60.sp, color: AppColors.mainColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DistanceWidget extends StatefulWidget {
  const DistanceWidget({
    super.key,
  });

  @override
  DistanceWidgetState createState() => DistanceWidgetState();
}

class DistanceWidgetState extends State<DistanceWidget> {
  double _distance = 0.0; // Distance in meters
  Position? _previousPosition;

  @override
  void initState() {
    super.initState();
    _startTrackingDistance();
  }

  Future<void> _startTrackingDistance() async {
    // Check location permissions
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return;
      }
    }

    // Listen to location updates
    Geolocator.getPositionStream().listen((Position position) {
      if (_previousPosition != null) {
        // Calculate distance between previous and current position
        double distanceInMeters = Geolocator.distanceBetween(
          _previousPosition!.latitude,
          _previousPosition!.longitude,
          position.latitude,
          position.longitude,
        );
        setState(() {
          _distance += distanceInMeters;
        });
      }
      _previousPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateCards(
      title: "Distance",
      value:
          "${(_distance / 1000).toStringAsFixed(2)} km", // Convert meters to kilometers
      imagePath: "assets/images/speed.png",
    );
  }
}
