import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:weatherapp/services/sharedprefservice.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/models/weather_api.dart';
import 'package:http/http.dart' as http;

Future<List> getweather(String lat, String lon, String city) async {
  http.Response weatherapiresponce;
  http.Response weatheraqi;
  http.Response hourlyweather;
  city = SharedPrefService.getcity().toString();
  if (city == '') {
    weatherapiresponce = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric'));
  } else {
    weatherapiresponce = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric'));
  }

  weatheraqi = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$apikey&units=metric'));

  if (city == '') {
    hourlyweather = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apikey&units=metric'));
  } else {
    hourlyweather = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apikey&units=metric'));
  }

  ForecastHourly weatherHourly = ForecastHourly(hourly: []);
  WeatherAPIModel weather = WeatherAPIModel();
  AQI weatherAQI = AQI();
  if (weatherapiresponce.statusCode == 200 &&
      weatheraqi.statusCode == 200 &&
      hourlyweather.statusCode == 200) {
    log("Status code is correct 200");
    weather = WeatherAPIModel.fromJson(jsonDecode(weatherapiresponce.body));
    weatherAQI = AQI.fromJson(jsonDecode(weatheraqi.body));
    weatherHourly = ForecastHourly.fromJson(jsonDecode(hourlyweather.body));
    log("from for loop getweather${weatherHourly.hourly[0].weather![0].main.toString()}");
  } else {
    Fluttertoast.showToast(msg: "Error in API");
  }

  return [weather, weatherAQI, weatherHourly];
}
