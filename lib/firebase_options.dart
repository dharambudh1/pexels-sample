import "package:firebase_core/firebase_core.dart" show FirebaseOptions;
import "package:flutter/foundation.dart"
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  FirebaseOptions get currentPlatform {
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
          "DefaultFirebaseOptions have not been configured for windows - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for linux - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for fuchsia - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
    }
  }

  final FirebaseOptions web = const FirebaseOptions(
    apiKey: "AIzaSyC_eOVLOuxIyMaiNNMtCnX0AbT6Zr72H1g",
    appId: "1:789524751536:web:34bdcab7336079b4908775",
    messagingSenderId: "789524751536",
    projectId: "pexels-sample-66475",
    authDomain: "pexels-sample-66475.firebaseapp.com",
    storageBucket: "pexels-sample-66475.appspot.com",
  );

  final FirebaseOptions android = const FirebaseOptions(
    apiKey: "AIzaSyAxr9HbBwA1-hpHtQ2ekCcMfBun5UXvOpY",
    appId: "1:789524751536:android:b6a365e487774ad4908775",
    messagingSenderId: "789524751536",
    projectId: "pexels-sample-66475",
    storageBucket: "pexels-sample-66475.appspot.com",
  );

  final FirebaseOptions ios = const FirebaseOptions(
    apiKey: "AIzaSyArLbhDlWCoLuYtJAc11JNu2F32ZW2ASjc",
    appId: "1:789524751536:ios:74cf8d4b53bff57f908775",
    messagingSenderId: "789524751536",
    projectId: "pexels-sample-66475",
    storageBucket: "pexels-sample-66475.appspot.com",
    iosBundleId: "com.example.pexelsSample",
  );

  final FirebaseOptions macos = const FirebaseOptions(
    apiKey: "AIzaSyArLbhDlWCoLuYtJAc11JNu2F32ZW2ASjc",
    appId: "1:789524751536:ios:471f3bbed2ecf373908775",
    messagingSenderId: "789524751536",
    projectId: "pexels-sample-66475",
    storageBucket: "pexels-sample-66475.appspot.com",
    iosBundleId: "com.example.pexelsSample.RunnerTests",
  );
}
