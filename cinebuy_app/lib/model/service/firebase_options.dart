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
    apiKey: 'AIzaSyDaCgGUQC5mrIt8wFDAJ_r4gjKhC5VPDno',
    appId: '1:375590425557:web:50d7803b31123bf6d6635c',
    messagingSenderId: '375590425557',
    projectId: 'mini-project-cinebuy',
    authDomain: 'mini-project-cinebuy.firebaseapp.com',
    storageBucket: 'mini-project-cinebuy.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeStLQcwzNOxa3uHG3cjYvRqLt4bSYnIA',
    appId: '1:375590425557:android:d51140df19f9a128d6635c',
    messagingSenderId: '375590425557',
    projectId: 'mini-project-cinebuy',
    storageBucket: 'mini-project-cinebuy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-JvrVMm6LXGVFTgHa-cUjUKG3kHaSLJw',
    appId: '1:375590425557:ios:9c035679de48d79fd6635c',
    messagingSenderId: '375590425557',
    projectId: 'mini-project-cinebuy',
    storageBucket: 'mini-project-cinebuy.appspot.com',
    iosClientId: '375590425557-2l74uajodeodgtk8f301si0sb9nrkbrk.apps.googleusercontent.com',
    iosBundleId: 'com.example.cinebuyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-JvrVMm6LXGVFTgHa-cUjUKG3kHaSLJw',
    appId: '1:375590425557:ios:9c035679de48d79fd6635c',
    messagingSenderId: '375590425557',
    projectId: 'mini-project-cinebuy',
    storageBucket: 'mini-project-cinebuy.appspot.com',
    iosClientId: '375590425557-2l74uajodeodgtk8f301si0sb9nrkbrk.apps.googleusercontent.com',
    iosBundleId: 'com.example.cinebuyApp',
  );
}
