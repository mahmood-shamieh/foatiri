// ignore_for_file: file_names

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBzrRU0YRMx1ffwXtY9RXKgUSJN21ZmYwc',
    appId: '1:964349769021:web:354af034a89cd345e04154',
    messagingSenderId: '420044780495',
    projectId: 'tornado-app-a4bc6',
    authDomain: 'tornado-app-a4bc6.firebaseapp.com',
    storageBucket: 'tornado-app-a4bc6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBrzr8-qBtzDtgT8My0dwVvptQbC95eE8',
    appId: '1:420044780495:android:2514cfc6c8abbca49058ba',
    messagingSenderId: '420044780495',
    projectId: 'tornado-app-a4bc6',
    storageBucket: 'tornado-app-a4bc6.appspot.com',
  );
}
