// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members

// Package imports:
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
    apiKey: 'AIzaSyC612oMnjgvcmrb5wHC2bFQEePly365A0A',
    appId: '1:522799908925:web:85116b6028f356c09c8254',
    messagingSenderId: '522799908925',
    projectId: 'dexter-shift-planner',
    authDomain: 'dexter-shift-planner.firebaseapp.com',
    storageBucket: 'dexter-shift-planner.appspot.com',
    measurementId: 'G-CMM7CTK6B5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD70Ke5wMVlMnIZ6oWRsBMN8VuquHque5o',
    appId: '1:522799908925:android:4667e55d3368e3ad9c8254',
    messagingSenderId: '522799908925',
    projectId: 'dexter-shift-planner',
    storageBucket: 'dexter-shift-planner.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEaNbrd1auf6mLUG14nH1J9-pBOku1owU',
    appId: '1:522799908925:ios:7d5ca27dafafee729c8254',
    messagingSenderId: '522799908925',
    projectId: 'dexter-shift-planner',
    storageBucket: 'dexter-shift-planner.appspot.com',
    iosClientId: '522799908925-g05i7jocueegsma47lm0ea1ae0tdnmg9.apps.googleusercontent.com',
    iosBundleId: 'com.dexter.health.shift.planner',
  );
}