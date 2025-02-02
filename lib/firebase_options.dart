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
    apiKey: 'AIzaSyDFJ7Yii-Bstm-2QVGo7DY09tN5SYjvoYY',
    appId: '1:687580991694:web:c41b4e92a08a9344f1409f',
    messagingSenderId: '687580991694',
    projectId: 'fir-b2712',
    storageBucket: 'fir-b2712.firebasestorage.app',
    iosBundleId: 'com.example.firebaseSetup',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFJ7Yii-Bstm-2QVGo7DY09tN5SYjvoYY',
    appId: '1:687580991694:android:5970da942263644ef1409f',
    messagingSenderId: '687580991694',
    projectId: 'fir-b2712',
    storageBucket: 'fir-b2712.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrd6qCQhVosnXPY-Ozqu5BHfE18tN-GgI',
    appId: '1:687580991694:ios:f94e3dc785cb11d7f1409f',
    messagingSenderId: '687580991694',
    projectId: 'fir-b2712',
    storageBucket: 'fir-b2712.firebasestorage.app',
    iosBundleId: 'com.example.firebaseSetup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrd6qCQhVosnXPY-Ozqu5BHfE18tN-GgI',
    appId: '1:687580991694:ios:f94e3dc785cb11d7f1409f',
    messagingSenderId: '687580991694',
    projectId: 'fir-b2712',
    storageBucket: 'fir-b2712.firebasestorage.app',
    iosBundleId: 'com.example.firebaseSetup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQo5NXdy45lqnuCWzosX05k_a6ApnHKMQ',
    appId: '1:687580991694:web:c41b4e92a08a9344f1409f',
    messagingSenderId: '687580991694',
    projectId: 'fir-b2712',
    authDomain: 'fir-b2712.firebaseapp.com',
    storageBucket: 'fir-b2712.firebasestorage.app',
    measurementId: 'G-VYETZS12RZ',
  );
}
