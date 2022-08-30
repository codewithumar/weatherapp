// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:weatherapp/constants.dart';

class DailyWeatherCard extends StatelessWidget {
  DailyWeatherCard({
    Key? key,
    required this.time,
    required this.iconfromapi,
    required this.temp,
    required this.windspeed,
  }) : super(key: key);
  String time;
  String temp;
  String windspeed;
  String iconfromapi;
  String icon = rainclouds;
  @override
  Widget build(BuildContext context) {
    if (iconfromapi == "Thenderstorm") {
      icon = lightcloud;
    } else if (iconfromapi == "Rain") {
      icon = rainclouds;
    } else if (iconfromapi == "Clear") {
      icon = sun;
    } else if (iconfromapi == "Clouds") {
      icon = cloudwithsun;
    }
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Text(
          "$temp °C",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        Image.asset(
          icon,
          height: 50,
          width: 50,
        ),
        Text(
          "$windspeed Km/h ",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
