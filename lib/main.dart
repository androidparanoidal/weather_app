import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_search_screen.dart';
import 'package:weather_app/screens/login_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            //subtitle1: TextStyle(color: Colors.black),
            ),
      ),
      home: WelcomeScreen(),
    );
  }
}
