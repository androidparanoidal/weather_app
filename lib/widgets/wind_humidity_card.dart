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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child:
                      Util.getIcons(CupertinoIcons.wind, CupertinoIcons.drop),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Util.getValues(wind!.toInt(), ' m/s', humidity!, '%'),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Слабый ветер',
                      style: TextStyle(
                          color: Colors.white)), //или направление ветра указать
                  SizedBox(height: 10),
                  Text('Высокая влажность',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
