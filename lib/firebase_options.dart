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
    apiKey: 'AIzaSyCjTxq0yieSxOr7RKOtSIfq0oCajZuasZY',
    appId: '1:871768823458:web:bd56183717ff30cfd6e9fb',
    messagingSenderId: '871768823458',
    projectId: 'flutter-9c48b',
    authDomain: 'flutter-9c48b.firebaseapp.com',
    storageBucket: 'flutter-9c48b.appspot.com',
    measurementId: 'G-8MWP67Z9HF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBljezOv0uIScva8vHJFAfcPjQCdIzDVUQ',
    appId: '1:871768823458:android:09990d6925a27963d6e9fb',
    messagingSenderId: '871768823458',
    projectId: 'flutter-9c48b',
    storageBucket: 'flutter-9c48b.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCjTxq0yieSxOr7RKOtSIfq0oCajZuasZY',
    appId: '1:871768823458:web:a265682ac78b9d62d6e9fb',
    messagingSenderId: '871768823458',
    projectId: 'flutter-9c48b',
    authDomain: 'flutter-9c48b.firebaseapp.com',
    storageBucket: 'flutter-9c48b.appspot.com',
    measurementId: 'G-Y1TTG7WFG0',
  );
}