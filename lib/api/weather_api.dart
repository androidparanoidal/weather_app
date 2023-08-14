import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/location.dart';

class WeatherAPI {
  Future<WeatherModel> getWeather({String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String>? parametrs;

    if (isCity == true) {
      var queryParametrs = {
        'APPID': Constants.WEATHER_API_KEY,
        'units': 'metric',
        'q': cityName,
      };
      parametrs = queryParametrs.cast<String, String>();
    } else {
      var queryParametrs = {
        'APPID': Constants.WEATHER_API_KEY,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parametrs = queryParametrs;
    }

    var uri = Uri.https(
        Constants.WEATHER_BASE_DOMAIN, Constants.WEATHER_PATH, parametrs);

    var response = await http.get(uri);

    print(response.body);

    if (response.statusCode == 200) {
      //parsing model
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Future.error('Error response');
    }
  }
}
