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
    apiKey: 'AIzaSyDKEaKukZuwF8NFTaxYobPVtaCdNyNyxk4',
    appId: '1:277436101182:web:865e692eed86b045e9576f',
    messagingSenderId: '277436101182',
    projectId: 'notice-app-a99a4',
    authDomain: 'notice-app-a99a4.firebaseapp.com',
    databaseURL: 'https://notice-app-a99a4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notice-app-a99a4.appspot.com',
    measurementId: 'G-MJCQTH4SZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEQfj49klz6FBrDS03ykixrTFdZX-lscM',
    appId: '1:277436101182:android:338909b553912950e9576f',
    messagingSenderId: '277436101182',
    projectId: 'notice-app-a99a4',
    databaseURL: 'https://notice-app-a99a4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notice-app-a99a4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCn67yx5h3x-HrFP4E1j0UERenhXayauJs',
    appId: '1:277436101182:ios:72c306894088e955e9576f',
    messagingSenderId: '277436101182',
    projectId: 'notice-app-a99a4',
    databaseURL: 'https://notice-app-a99a4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notice-app-a99a4.appspot.com',
    iosBundleId: 'com.example.myNotifyi',
  );
}