import 'package:flutter/material.dart';
import 'package:weather_app/screens/login_screen.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0700FF), Colors.black],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'WEATHER SERVICE',
                    style: TextStyle(
                      fontSize: 48.0,
                      color: Colors.white,
                      fontFamily: 'Inter Bold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'dawn is coming soon',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontFamily: 'Inter Light',
                    //fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
