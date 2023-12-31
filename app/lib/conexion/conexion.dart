import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyC1eJCU_Fgnv_spmQ22WCLudl_05N1pJiQ',
    appId: '1:789878987138:web:4334bfe238dc3da492179b',
    messagingSenderId: '789878987138',
    projectId: 'dreams-ecommerce',
    authDomain: 'dreams-ecommerce.firebaseapp.com',
    storageBucket: 'dreams-ecommerce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMnGeHkXsUjIFvQpXhLjWp-sl_cYlczs8',
    appId: '1:789878987138:android:407a0e8c70229e2892179b',
    messagingSenderId: '789878987138',
    projectId: 'dreams-ecommerce',
    storageBucket: 'dreams-ecommerce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1TKoyHhmkiTo6qMU9UQZ8VZs-PmS9VqU',
    appId: '1:789878987138:ios:8d453c27b6695b6092179b',
    messagingSenderId: '789878987138',
    projectId: 'dreams-ecommerce',
    storageBucket: 'dreams-ecommerce.appspot.com',
    iosClientId: '789878987138-h82vd1b11mpgrd81a35da5ds37lncina.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1TKoyHhmkiTo6qMU9UQZ8VZs-PmS9VqU',
    appId: '1:789878987138:ios:ac7a4a9aa30c3aa292179b',
    messagingSenderId: '789878987138',
    projectId: 'dreams-ecommerce',
    storageBucket: 'dreams-ecommerce.appspot.com',
    iosClientId: '789878987138-2j824g37ct8g208095aeutgem8e453jh.apps.googleusercontent.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}