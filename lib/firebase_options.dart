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
    apiKey: 'AIzaSyAia__5el31WnOxSwu9mOyck7Ek82nyZ1M',
    appId: '1:369705483544:web:2ce9c3eede98e6dfcbb26d',
    messagingSenderId: '369705483544',
    projectId: 'fruits-app-9d3e5',
    authDomain: 'fruits-app-9d3e5.firebaseapp.com',
    storageBucket: 'fruits-app-9d3e5.appspot.com',
    measurementId: 'G-FPZ0BYPLPS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaIZJaTGTFJCsavRpl_4hXIUp73tfUMX8',
    appId: '1:369705483544:android:a97d39b7731ab029cbb26d',
    messagingSenderId: '369705483544',
    projectId: 'fruits-app-9d3e5',
    storageBucket: 'fruits-app-9d3e5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIO5xyNOKTBcyTAIuelOqiJ9rLcNOUftY',
    appId: '1:369705483544:ios:06e9209364f5daa7cbb26d',
    messagingSenderId: '369705483544',
    projectId: 'fruits-app-9d3e5',
    storageBucket: 'fruits-app-9d3e5.appspot.com',
    iosBundleId: 'com.example.fruitsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIO5xyNOKTBcyTAIuelOqiJ9rLcNOUftY',
    appId: '1:369705483544:ios:06e9209364f5daa7cbb26d',
    messagingSenderId: '369705483544',
    projectId: 'fruits-app-9d3e5',
    storageBucket: 'fruits-app-9d3e5.appspot.com',
    iosBundleId: 'com.example.fruitsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAia__5el31WnOxSwu9mOyck7Ek82nyZ1M',
    appId: '1:369705483544:web:8b8427bd07dddf40cbb26d',
    messagingSenderId: '369705483544',
    projectId: 'fruits-app-9d3e5',
    authDomain: 'fruits-app-9d3e5.firebaseapp.com',
    storageBucket: 'fruits-app-9d3e5.appspot.com',
    measurementId: 'G-6DBX9W32Y6',
  );
}
