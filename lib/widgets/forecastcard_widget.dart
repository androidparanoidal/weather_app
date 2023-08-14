import 'package:flutter/material.dart';
import 'package:weather_app/forecast_util.dart';

Widget ForecastCard(AsyncSnapshot snapshot, int index) {
  var forecastDateList = snapshot.data?.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastDateList[index].dt * 1000);

  var temp = forecastDateList[index].main?.temp?.toInt();
  var icon = forecastDateList[index].getIconUrl();
  var hours = Util.getHoursData(date);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$hours',
        style: TextStyle(color: Colors.white),
      ),
      Image.network(
        icon,
        scale: 1.2,
        color: Colors.white,
      ),
      Text(
        ' $temp°', //
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
    ],
  );
}
