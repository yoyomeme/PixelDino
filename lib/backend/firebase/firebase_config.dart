import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBiuxR3zfM7X_q1TtZmV0oFwkSfdhF0XNA",
            authDomain: "myydoctor-av31fx.firebaseapp.com",
            projectId: "myydoctor-av31fx",
            storageBucket: "myydoctor-av31fx.appspot.com",
            messagingSenderId: "507909969335",
            appId: "1:507909969335:web:918427f5897973817d0432"));
  } else {
    await Firebase.initializeApp();
  }
}
