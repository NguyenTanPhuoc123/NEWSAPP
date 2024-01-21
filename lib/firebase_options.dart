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
    apiKey: 'AIzaSyC92EnVDJgj70TIbDqlJdyopNJseeOoqY0',
    appId: '1:888689822494:web:05392a4bc6991b7248970f',
    messagingSenderId: '888689822494',
    projectId: 'newsapp-a46a0',
    authDomain: 'newsapp-a46a0.firebaseapp.com',
    databaseURL: 'https://newsapp-a46a0-default-rtdb.firebaseio.com',
    storageBucket: 'newsapp-a46a0.appspot.com',
    measurementId: 'G-0NYV4E55QD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIIbHtL90_buYKjT-y2-aOfjdO3STpuxU',
    appId: '1:888689822494:android:189671af79dcea8248970f',
    messagingSenderId: '888689822494',
    projectId: 'newsapp-a46a0',
    databaseURL: 'https://newsapp-a46a0-default-rtdb.firebaseio.com',
    storageBucket: 'newsapp-a46a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8jCNAtrVO2anmDKkpvzoUdYplstgUb1U',
    appId: '1:888689822494:ios:76abf26ae529703948970f',
    messagingSenderId: '888689822494',
    projectId: 'newsapp-a46a0',
    databaseURL: 'https://newsapp-a46a0-default-rtdb.firebaseio.com',
    storageBucket: 'newsapp-a46a0.appspot.com',
    iosBundleId: 'com.example.doandidong',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8jCNAtrVO2anmDKkpvzoUdYplstgUb1U',
    appId: '1:888689822494:ios:1209bdb42b55200c48970f',
    messagingSenderId: '888689822494',
    projectId: 'newsapp-a46a0',
    databaseURL: 'https://newsapp-a46a0-default-rtdb.firebaseio.com',
    storageBucket: 'newsapp-a46a0.appspot.com',
    iosBundleId: 'com.example.doandidong.RunnerTests',
  );
}
