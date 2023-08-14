import 'package:flutter/material.dart';
import '../model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  WeatherCard({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastDateList = snapshot.data?.list;
    var icon = forecastDateList?[0].getIconUrl();
    var temp = forecastDateList?[0].main?.temp?.toInt();
    var description =
        forecastDateList![0].weather?[0].description?.toUpperCase();
    var maxTemp = forecastDateList[0].main?.tempMax?.toInt();
    var minTemp = forecastDateList[0].main?.tempMin?.toInt();

    return Container(
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/Ellipse.png', width: 100, fit: BoxFit.fill),
                Image.network(
                  icon!,
                  scale: 0.6,
                  color: Colors.white,
                ),
              ],
            ),
            Text(
              '$temp°',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Ubuntu', fontSize: 64.0),
            ),
            Text(
              '$description',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Roboto', fontSize: 17.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                'Макс.: $maxTemp°   Мин: $minTemp°',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Roboto', fontSize: 17.0),
              ),
            ),
            Container(color: Colors.black26)
          ],
        ),
      ),
    );
  }
}

// Stack(
// alignment: Alignment.center,
// children: [
// Image(
// image: AssetImage("images/Ellipse.png"),
// height: 200,
// fit: BoxFit.fill),
// Image(
// image: AssetImage("images/pic1.png"),
// height: 150,
// fit: BoxFit.fill),
// ],
// ),
