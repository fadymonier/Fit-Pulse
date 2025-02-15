// ignore_for_file: deprecated_member_use

import 'package:fitpulse/features/player_info/presentation/widgets/marmoush/state_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:fitpulse/core/models/app_title.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/core/utils/app_text_styles.dart';
import 'dart:math' as math;

class AccelerationWidget extends StatefulWidget {
  const AccelerationWidget({
    super.key,
  });

  @override
  AccelerationWidgetState createState() => AccelerationWidgetState();
}

class AccelerationWidgetState extends State<AccelerationWidget> {
  double _acceleration = 0.0;
  bool _isMoving = false;

  @override
  void initState() {
    super.initState();
    _startListeningToAccelerometer();
  }

  void _startListeningToAccelerometer() {
    // Listen to linear accelerometer events (excludes gravity)
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      // Calculate the magnitude of the acceleration vector
      double magnitude = _calculateMagnitude(event.x, event.y, event.z);

      // Define a threshold for movement detection
      double movementThreshold = 0.1; // Adjust this value as needed

      // Check if the device is moving
      bool isMoving = magnitude > movementThreshold;

      // Update the UI
      setState(() {
        _acceleration = magnitude; // Use magnitude directly (in m/s²)
        _isMoving = isMoving;
      });
    });
  }

  // Helper function to calculate the magnitude of the acceleration vector
  double _calculateMagnitude(double x, double y, double z) {
    return math.sqrt(x * x + y * y + z * z);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 120.h,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0.r),
                      child: AppTitle(
                          title: "Velocity",
                          showDivider: true,
                          textStyle: AppTextStyles.roboto16MainColor700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0.r),
                      child: Text(
                        _isMoving
                            ? "${_acceleration.toStringAsFixed(2)} m/s²"
                            : "Not Moving",
                        style: AppTextStyles.roboto14BlackColor700,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(4.0.r),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.speed,
                        size: 55.sp, color: AppColors.mainColor),
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
