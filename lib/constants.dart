import 'package:flutter/material.dart';

const kBlueColor = Color(0xFF0700FF);

class Constants {
  static const String WEATHER_API_KEY = '7f3c57f0d9a7e1bb842c19930493a41b';
  static const String WEATHER_BASE = 'https://';
  static const String WEATHER_BASE_DOMAIN = 'api.openweathermap.org';
  static const String WEATHER_PATH = '/data/2.5/forecast'; // ?q={cityName}
  static const String WEATHER_ICON_PATH = '/img/w/';
  static const String WEATHER_ICON_URL =
      WEATHER_BASE + WEATHER_BASE_DOMAIN + WEATHER_ICON_PATH;
}
