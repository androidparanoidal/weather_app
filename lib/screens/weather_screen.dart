import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/hourly_weather_card.dart';
import 'package:weather_app/widgets/weather_card.dart';
import 'package:weather_app/widgets/wind_humidity_card.dart';
import '../api/weather_api.dart';
import '../model/weather_model.dart';
import 'city_search_screen.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Row(),
        actions: [
          Row(
            children: [
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                    onPressed: () async {
                      var tappedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CitySearchScreen()));
                      if (tappedName != null) {
                        setState(() {
                          _cityName = tappedName;
                          forecastObject = WeatherAPI()
                              .getWeather(cityName: _cityName, isCity: true);
                        });
                      }
                    },
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(Icons.search, color: Colors.white)),
              ),
              SizedBox(width: 50),
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  },
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.logout_outlined, color: Colors.white),
                ),
              ),
              SizedBox(width: 15),
            ],
          )
        ],
      ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          forecastObject =
                                              WeatherAPI().getWeather();
                                        });
                                      },
                                      padding: EdgeInsets.all(0.0),
                                      icon: Icon(Icons.location_on_outlined,
                                          color: Colors.white),
                                    ),
                                  ),
                                  CityView(snapshot: snapshot),
                                ],
                              ),
                            ],
                          ),
                        ),
                        WeatherCard(snapshot: snapshot),
                        HourlyWeatherCard(snapshot: snapshot),
                        WindHumidityCard(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: 100),
                          Text(
                            'Город не найден!\nВведите корректное название.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          //SizedBox(height: 30),
                        ],
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
