// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD82RCHMKueDfHnSXi6hM-wpenIwmTDNNk',
    appId: '1:826252725019:web:1d5a2579d91655419721be',
    messagingSenderId: '826252725019',
    projectId: 'fitpulse-30e9c',
    authDomain: 'fitpulse-30e9c.firebaseapp.com',
    databaseURL: 'https://fitpulse-30e9c-default-rtdb.firebaseio.com',
    storageBucket: 'fitpulse-30e9c.firebasestorage.app',
    measurementId: 'G-JL9CCWVMBB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXesLa09nTL4DkKYqDe4DQf-h6zsc2jeE',
    appId: '1:826252725019:android:ee34dac97cbddea69721be',
    messagingSenderId: '826252725019',
    projectId: 'fitpulse-30e9c',
    databaseURL: 'https://fitpulse-30e9c-default-rtdb.firebaseio.com',
    storageBucket: 'fitpulse-30e9c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCu7GnwqktGzDSg0rwrItuA5zMoblbNWgA',
    appId: '1:826252725019:ios:83a17aa668828fe19721be',
    messagingSenderId: '826252725019',
    projectId: 'fitpulse-30e9c',
    databaseURL: 'https://fitpulse-30e9c-default-rtdb.firebaseio.com',
    storageBucket: 'fitpulse-30e9c.firebasestorage.app',
    iosBundleId: 'com.example.fitpulse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCu7GnwqktGzDSg0rwrItuA5zMoblbNWgA',
    appId: '1:826252725019:ios:83a17aa668828fe19721be',
    messagingSenderId: '826252725019',
    projectId: 'fitpulse-30e9c',
    databaseURL: 'https://fitpulse-30e9c-default-rtdb.firebaseio.com',
    storageBucket: 'fitpulse-30e9c.firebasestorage.app',
    iosBundleId: 'com.example.fitpulse',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD82RCHMKueDfHnSXi6hM-wpenIwmTDNNk',
    appId: '1:826252725019:web:cf2dcf86b4c8b48b9721be',
    messagingSenderId: '826252725019',
    projectId: 'fitpulse-30e9c',
    authDomain: 'fitpulse-30e9c.firebaseapp.com',
    databaseURL: 'https://fitpulse-30e9c-default-rtdb.firebaseio.com',
    storageBucket: 'fitpulse-30e9c.firebasestorage.app',
    measurementId: 'G-8DRYJJ2EZ3',
  );
}
