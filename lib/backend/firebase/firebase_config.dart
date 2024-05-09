import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKlbNMfrFqLtv6Lt4A-yq0mZMT9quguyY",
            authDomain: "sconnect-pos.firebaseapp.com",
            projectId: "sconnect-pos",
            storageBucket: "sconnect-pos.appspot.com",
            messagingSenderId: "815478550082",
            appId: "1:815478550082:web:fba6762c458bd519e247db",
            measurementId: "G-FXTJKV8D83"));
  } else {
    await Firebase.initializeApp();
  }
}
