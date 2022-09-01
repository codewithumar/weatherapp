// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_api.dart';
import 'package:weatherapp/widgets/sevendaycard.dart';

class FiveDayForcatScreen extends StatefulWidget {
  FiveDayForcatScreen(
      {Key? key,
      required this.aqi,
      required this.hourly,
      required this.weather})
      : super(key: key);
  WeatherAPIModel weather;
  AQI aqi;
  ForecastHourly hourly;

  @override
  State<FiveDayForcatScreen> createState() => _FiveDayForcatScreenState();
}

class _FiveDayForcatScreenState extends State<FiveDayForcatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 27, 116, 199),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(248, 27, 116, 199),
        title: const Text('5-Day Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(7, 40, 5, 0),
        child: Row(children: [
          SevenDayCard(
            date: convertmillisectodate(widget.hourly.hourly[0].dt!).toString(),
            day: "Today",
            iconfromapi: widget.hourly.hourly[0].weather![0].main.toString(),
            temp: "${widget.hourly.hourly[0].main!.temp!.round().toString()}°C",
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          SevenDayCard(
            date: convertmillisectodate(widget.hourly.hourly[7].dt!).toString(),
            day: "Tomorrow",
            iconfromapi: widget.hourly.hourly[7].weather![0].main.toString(),
            temp: "${widget.hourly.hourly[7].main!.temp!.round().toString()}°C",
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          SevenDayCard(
            date:
                convertmillisectodate(widget.hourly.hourly[14].dt!).toString(),
            day: convertmillisectoday(widget.hourly.hourly[14].dt!).toString(),
            iconfromapi: widget.hourly.hourly[14].weather![0].main.toString(),
            temp:
                "${widget.hourly.hourly[14].main!.temp!.round().toString()}°C",
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          SevenDayCard(
            date:
                convertmillisectodate(widget.hourly.hourly[21].dt!).toString(),
            day: convertmillisectoday(widget.hourly.hourly[21].dt!).toString(),
            iconfromapi: widget.hourly.hourly[21].weather![0].main.toString(),
            temp:
                "${widget.hourly.hourly[21].main!.temp!.round().toString()}°C",
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          SevenDayCard(
            date:
                convertmillisectodate(widget.hourly.hourly[35].dt!).toString(),
            day: convertmillisectoday(widget.hourly.hourly[35].dt!).toString(),
            iconfromapi: widget.hourly.hourly[35].weather![0].main.toString(),
            temp:
                "${widget.hourly.hourly[35].main!.temp!.round().toString()}°C",
          ),
        ]),
      ),
    );
  }

  String convertmillisectodate(int dt) {
    var time = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

    var date = DateFormat('dd/MM').format(time);
    return date;
  }

  String convertmillisectoday(int dt) {
    var time = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

    var date = DateFormat('E').format(time);
    return date;
  }
}
