import 'package:flutter/material.dart';
import '../model/weather_model.dart';

// the top widget
class CityView extends StatefulWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  CityView({required this.snapshot});
  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  @override
  Widget build(BuildContext context) {
    late Future<WeatherModel> forecastObject;

    var city = widget.snapshot.data?.city?.name;
    var country = widget.snapshot.data?.city?.country;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                '$city, $country',
                style: TextStyle(
                    color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
