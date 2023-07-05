import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'

    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class ConexionFirebase {
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
    apiKey: 'AIzaSyD6fXmeixXEWTj8lBFZc1-9R2MyW8zkQJ0',
    appId: '1:773530338893:web:ec298a8d8bd9cec932fe04',
    messagingSenderId: '773530338893',
    projectId: 'edreamsdb',
    authDomain: 'edreamsdb.firebaseapp.com',
    storageBucket: 'edreamsdb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdpPARnAvu6HAPV7-VUtFNUXryPOuSaGg',
    appId: '1:773530338893:android:6debdcc42bb07bae32fe04',
    messagingSenderId: '773530338893',
    projectId: 'edreamsdb',
    storageBucket: 'edreamsdb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8pmH8eA6DY8GNktgzNlJ2RgAvqAaqxNI',
    appId: '1:773530338893:ios:60473e29aa3cd80532fe04',
    messagingSenderId: '773530338893',
    projectId: 'edreamsdb',
    storageBucket: 'edreamsdb.appspot.com',
    iosClientId: '773530338893-if05ltccmou5lavc1dihth62m1abblae.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8pmH8eA6DY8GNktgzNlJ2RgAvqAaqxNI',
    appId: '1:773530338893:ios:4b5c1eb22ffef9d132fe04',
    messagingSenderId: '773530338893',
    projectId: 'edreamsdb',
    storageBucket: 'edreamsdb.appspot.com',
    iosClientId: '773530338893-i6vvbf40o4159qsoetju8e2lgi2dnl4e.apps.googleusercontent.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
