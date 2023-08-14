import 'package:flutter/material.dart';
import 'package:weather_app/forecast_util.dart';
import 'package:weather_app/widgets/forecastcard_widget.dart';
import '../model/weather_model.dart';

class HourlyWeatherCard extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  HourlyWeatherCard({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastDateList = snapshot.data?.list;
    var unformatedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastDateList![0].dt! * 1000);

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
                  const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Сегодня', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 100),
                  Text('${Util.getFormatedDate(unformatedDate)}',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Container(
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 4),
                itemCount: snapshot.data!.list!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 74,
                  height: 142,
                  child: ForecastCard(snapshot, index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
