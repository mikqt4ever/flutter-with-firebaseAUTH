import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard.dart';
import 'loginform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJ2Wk7EFI8cySimfHp-iJolEPJnlMAx40",
            authDomain: "flutter-94892.firebaseapp.com",
            projectId: "flutter-94892",
            storageBucket: "flutter-94892.appspot.com",
            messagingSenderId: "869913189657",
            appId: "1:869913189657:web:cb8c12e296a8aa06c0f988",
            measurementId: "G-Y1PX13Y3H6"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Login',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
