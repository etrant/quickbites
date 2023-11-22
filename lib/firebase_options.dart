// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, no_default_cases
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDFwS4XmV6oD9Xziktczz9VbWZH9KI2XUY',
    appId: '1:520685792479:web:fe900c25d1d807b26d0d6a',
    messagingSenderId: '520685792479',
    projectId: 'quickbites-437a8',
    authDomain: 'quickbites-437a8.firebaseapp.com',
    storageBucket: 'quickbites-437a8.appspot.com',
    measurementId: 'G-6GV3WXZ22H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUJvQ6CU3UZAPjQYUzpGTMeCrYdvkJaA4',
    appId: '1:520685792479:android:351d54faf5f7f5536d0d6a',
    messagingSenderId: '520685792479',
    projectId: 'quickbites-437a8',
    storageBucket: 'quickbites-437a8.appspot.com',
  );
}
