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
    apiKey: 'AIzaSyAx1TH3qifIOxYAZjl1lrQYC75KnKh6-CA',
    appId: '1:629772530088:web:28a8c9fb4c34354f572d9d',
    messagingSenderId: '629772530088',
    projectId: 'com-manirahmanzadeh-news',
    authDomain: 'com-manirahmanzadeh-news.firebaseapp.com',
    storageBucket: 'com-manirahmanzadeh-news.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3fp-2EgwqgJxL7iKzIwy1TC7HoD52DMs',
    appId: '1:629772530088:android:e0814bccb6b2a6d7572d9d',
    messagingSenderId: '629772530088',
    projectId: 'com-manirahmanzadeh-news',
    storageBucket: 'com-manirahmanzadeh-news.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByELT9yRlGz8wo4zRq4j9Cv5q9NaWXzuM',
    appId: '1:629772530088:ios:0192800ba25900fd572d9d',
    messagingSenderId: '629772530088',
    projectId: 'com-manirahmanzadeh-news',
    storageBucket: 'com-manirahmanzadeh-news.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByELT9yRlGz8wo4zRq4j9Cv5q9NaWXzuM',
    appId: '1:629772530088:ios:08cf9f0296c1ec36572d9d',
    messagingSenderId: '629772530088',
    projectId: 'com-manirahmanzadeh-news',
    storageBucket: 'com-manirahmanzadeh-news.appspot.com',
    iosBundleId: 'com.example.newsApp.RunnerTests',
  );
}
