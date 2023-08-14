import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/hourly_weather_card.dart';
import 'package:weather_app/widgets/weather_card.dart';
import 'package:weather_app/widgets/wind_humidity_card.dart';
import '../api/weather_api.dart';
import '../model/weather_model.dart';
import 'package:weather_app/forecast_util.dart';

import '../widgets/city_display_widget.dart';
import 'login_screen.dart';

class WeatherScreen extends StatefulWidget {
  final locationWeather;
  WeatherScreen({this.locationWeather});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<WeatherModel> forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0700FF), Colors.black],
          ),
        ),
        child: ListView(
          children: [
            Container(
              child: FutureBuilder<WeatherModel>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CityView(snapshot: snapshot),
                        ),
                        WeatherCard(snapshot: snapshot),
                        HourlyWeatherCard(snapshot: snapshot),
                        WindHumidityCard(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        'City not found\nplease enter correct city name',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
