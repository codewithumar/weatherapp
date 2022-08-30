// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:weatherapp/constants.dart';

class DailyWeatherCard extends StatelessWidget {
  DailyWeatherCard({Key? key, required this.date}) : super(key: key);
  String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const Text(
          ' date ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 9,
          ),
        ),
        Image.asset(
          aqiicon,
          height: 50,
          width: 50,
        ),
        const Text(
          "temp\u2103",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
