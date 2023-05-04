// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyA6rN7x9ZCTfDhc5Yu6-Js2RoRB6MJdpN0',
    appId: '1:442604889602:web:a8c6394af2480e03f2291b',
    messagingSenderId: '442604889602',
    projectId: 'internal-class-4',
    authDomain: 'internal-class-4.firebaseapp.com',
    storageBucket: 'internal-class-4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcXtqEcJKEaMtV5DyBh22lODj8OiTRRPQ',
    appId: '1:442604889602:android:308a6d434e7663eef2291b',
    messagingSenderId: '442604889602',
    projectId: 'internal-class-4',
    storageBucket: 'internal-class-4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDc_vAisU5JymYC_Qkz4zXq1JumYMFuZRw',
    appId: '1:442604889602:ios:04795cecbc3ad9f5f2291b',
    messagingSenderId: '442604889602',
    projectId: 'internal-class-4',
    storageBucket: 'internal-class-4.appspot.com',
    iosClientId: '442604889602-8kl0uq694jd124j63ke1sah0apm5j8ob.apps.googleusercontent.com',
    iosBundleId: 'com.example.internalClass4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDc_vAisU5JymYC_Qkz4zXq1JumYMFuZRw',
    appId: '1:442604889602:ios:04795cecbc3ad9f5f2291b',
    messagingSenderId: '442604889602',
    projectId: 'internal-class-4',
    storageBucket: 'internal-class-4.appspot.com',
    iosClientId: '442604889602-8kl0uq694jd124j63ke1sah0apm5j8ob.apps.googleusercontent.com',
    iosBundleId: 'com.example.internalClass4',
  );
}
