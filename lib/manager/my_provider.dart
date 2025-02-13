// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitpulse/firebase/functions/firebase_auth_functions.dart';
import 'package:fitpulse/firebase/models/user_auth_model.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  UserAuthModel? _userAuthModel;
  User? _firebaseUser;

  UserAuthModel? get userAuthModel => _userAuthModel;
  User? get firebaseUser => _firebaseUser;

  MyProvider() {
    _firebaseUser = FirebaseAuth.instance.currentUser;
    if (_firebaseUser != null) {
      initUser();
    }
  }

  Future<void> initUser() async {
    try {
      _userAuthModel = await FirebaseAuthFunctions.readUser();
      notifyListeners(); // Notify listeners after updating the user model
    } catch (e) {
      // Handle any errors that occur during user initialization
      print('Error initializing user: $e');
    }
  }
}
