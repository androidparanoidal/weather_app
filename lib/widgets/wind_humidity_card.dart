import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/forecast_util.dart';
import '../model/weather_model.dart';

class WindHumidityCard extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  WindHumidityCard({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastDateList = snapshot.data?.list;
    var humidity = forecastDateList?[0].main?.humidity;
    var wind = forecastDateList?[0].wind?.speed;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
          color: Color.fromRGBO(255, 255, 255, 0.25),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              child: Util.getItem(
                  CupertinoIcons.wind, wind!.toInt(), ' m/s', 'Слабый ветер'),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              child: Util.getItem(
                  CupertinoIcons.drop, humidity!, '%', 'Высокая влажность'),
            ),
          ],
        ),
      ),
    );
  }
}
