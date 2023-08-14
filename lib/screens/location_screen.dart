import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'weather_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherAPI().getWeather();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherScreen(
                    locationWeather: weatherInfo,
                  )));
    } catch (e) {
      throw (e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
