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
    apiKey: 'AIzaSyC71lgXi2yVOgpHiTJuC65vy44-fT42OZI',
    appId: '1:1018635441674:web:56f06af3c9f53aae41f1f3',
    messagingSenderId: '1018635441674',
    projectId: 'gatewatch-e0f67',
    authDomain: 'gatewatch-e0f67.firebaseapp.com',
    storageBucket: 'gatewatch-e0f67.appspot.com',
    measurementId: 'G-PN7SC284PJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgkYrJfmdGioJ5cHn2Ci8gjmFkfXgZKUo',
    appId: '1:1018635441674:android:4bdfee0cf5dde7f541f1f3',
    messagingSenderId: '1018635441674',
    projectId: 'gatewatch-e0f67',
    storageBucket: 'gatewatch-e0f67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtNgkEhzwbm-vraIMYfKqu-nOY_aSzwh0',
    appId: '1:1018635441674:ios:78fd01353ab8fd9b41f1f3',
    messagingSenderId: '1018635441674',
    projectId: 'gatewatch-e0f67',
    storageBucket: 'gatewatch-e0f67.appspot.com',
    iosClientId: '1018635441674-e665re5ddl456cgqjtt706g7qqq8eim9.apps.googleusercontent.com',
    iosBundleId: 'com.example.startertemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtNgkEhzwbm-vraIMYfKqu-nOY_aSzwh0',
    appId: '1:1018635441674:ios:78fd01353ab8fd9b41f1f3',
    messagingSenderId: '1018635441674',
    projectId: 'gatewatch-e0f67',
    storageBucket: 'gatewatch-e0f67.appspot.com',
    iosClientId: '1018635441674-e665re5ddl456cgqjtt706g7qqq8eim9.apps.googleusercontent.com',
    iosBundleId: 'com.example.startertemplate',
  );
}
