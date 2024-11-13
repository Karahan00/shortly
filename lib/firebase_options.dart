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
    apiKey: 'AIzaSyDDUsIvf54rIlhg0y1MpnC3YNQ3csWvjsM',
    appId: '1:1066638135365:web:fc3716443ce190b526d32c',
    messagingSenderId: '1066638135365',
    projectId: 'shortly-app-00',
    authDomain: 'shortly-app-00.firebaseapp.com',
    databaseURL: 'https://shortly-app-00-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shortly-app-00.firebasestorage.app',
    measurementId: 'G-GJ95CV6K7R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0t8BDzeWljyVbjWZak61QqywmVbz1MWc',
    appId: '1:1066638135365:android:66449290e45c14b026d32c',
    messagingSenderId: '1066638135365',
    projectId: 'shortly-app-00',
    databaseURL: 'https://shortly-app-00-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shortly-app-00.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9pK_yEzOBhR2ZBCpoGcyQ66FT-fXl91M',
    appId: '1:1066638135365:ios:4ccfeb7bc1470d1b26d32c',
    messagingSenderId: '1066638135365',
    projectId: 'shortly-app-00',
    databaseURL: 'https://shortly-app-00-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shortly-app-00.firebasestorage.app',
    iosBundleId: 'com.example.shortly',
  );
}