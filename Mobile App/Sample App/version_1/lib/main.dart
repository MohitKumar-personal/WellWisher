import 'package:flutter/material.dart';
import 'package:version_1/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

// https://firebase.flutter.dev/docs/overview/#using-the-flutterfire-cli

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


