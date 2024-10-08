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
    apiKey: 'AIzaSyBCzxuOlMjVCodoA7NOo2M1xfxVyt6IAm8',
    appId: '1:386930541847:web:80797343a2b48f08606352',
    messagingSenderId: '386930541847',
    projectId: 'fruits-hub-97028',
    authDomain: 'fruits-hub-97028.firebaseapp.com',
    storageBucket: 'fruits-hub-97028.appspot.com',
    measurementId: 'G-63LG5006RJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTmEF7hZX3ydsc77vb1rr-yaD7OPVzGsk',
    appId: '1:386930541847:android:9753a99aa9d50b35606352',
    messagingSenderId: '386930541847',
    projectId: 'fruits-hub-97028',
    storageBucket: 'fruits-hub-97028.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCug7EuIblqMLjm8BjEVD7_uK15l_H2Lp4',
    appId: '1:386930541847:ios:b2a31cdb4c6490cd606352',
    messagingSenderId: '386930541847',
    projectId: 'fruits-hub-97028',
    storageBucket: 'fruits-hub-97028.appspot.com',
    iosBundleId: 'com.example.fruitsHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCug7EuIblqMLjm8BjEVD7_uK15l_H2Lp4',
    appId: '1:386930541847:ios:b2a31cdb4c6490cd606352',
    messagingSenderId: '386930541847',
    projectId: 'fruits-hub-97028',
    storageBucket: 'fruits-hub-97028.appspot.com',
    iosBundleId: 'com.example.fruitsHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCzxuOlMjVCodoA7NOo2M1xfxVyt6IAm8',
    appId: '1:386930541847:web:ca33a4bbac07baea606352',
    messagingSenderId: '386930541847',
    projectId: 'fruits-hub-97028',
    authDomain: 'fruits-hub-97028.firebaseapp.com',
    storageBucket: 'fruits-hub-97028.appspot.com',
    measurementId: 'G-LYE42BK0VK',
  );
}
