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
    apiKey: 'AIzaSyAmqFnlVPSphI26NWeJhgxszulobvwfoZg',
    appId: '1:84634234878:web:d77f48a9c5274069005aaf',
    messagingSenderId: '84634234878',
    projectId: 'madsongapp',
    authDomain: 'madsongapp.firebaseapp.com',
    storageBucket: 'madsongapp.appspot.com',
    measurementId: 'G-889EBXTD6Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5mg6aC0MtSacplwdNpOq2_pxH1xRRAoI',
    appId: '1:84634234878:android:f86e98ae396fd31c005aaf',
    messagingSenderId: '84634234878',
    projectId: 'madsongapp',
    storageBucket: 'madsongapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxvuakUHRpf2iCbQd2A06HC-9QUKhFRX0',
    appId: '1:84634234878:ios:1fee0bf1efb02a67005aaf',
    messagingSenderId: '84634234878',
    projectId: 'madsongapp',
    storageBucket: 'madsongapp.appspot.com',
    iosBundleId: 'com.example.songapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxvuakUHRpf2iCbQd2A06HC-9QUKhFRX0',
    appId: '1:84634234878:ios:1fee0bf1efb02a67005aaf',
    messagingSenderId: '84634234878',
    projectId: 'madsongapp',
    storageBucket: 'madsongapp.appspot.com',
    iosBundleId: 'com.example.songapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmqFnlVPSphI26NWeJhgxszulobvwfoZg',
    appId: '1:84634234878:web:52207083621db3f5005aaf',
    messagingSenderId: '84634234878',
    projectId: 'madsongapp',
    authDomain: 'madsongapp.firebaseapp.com',
    storageBucket: 'madsongapp.appspot.com',
    measurementId: 'G-C0DEBBECHM',
  );

}