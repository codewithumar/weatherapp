// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:weatherapp/utils/constants.dart';

import 'package:weatherapp/models/weather_api.dart';

import 'package:weatherapp/screens/weatherscreen.dart';
import 'package:weatherapp/services/getweather.dart';
import 'package:weatherapp/services/locationservice.dart';
import 'package:weatherapp/services/sharedprefservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? latitude;
  String? longitude;
  String? city;
  @override
  void initState() {
    super.initState();
    log("Init Called");
    getlocation();
    latitude = SharedPrefService.getlat().toString();
    longitude = SharedPrefService.getlongi().toString();
    city = SharedPrefService.getcity().toString();
    log("latitude in init  ${latitude.toString()}");
    log("longitude in init  ${longitude.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getweather(latitude!, longitude!, city!),
      builder: ((BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          //log(snapshot.toString());
          return const Scaffold(
            body: Center(
              child: Text("Error Please Reload App"),
            ),
          );
        } else if (snapshot.hasData) {
          WeatherAPIModel weather = snapshot.data[0];
          AQI aqi = snapshot.data[1];
          ForecastHourly hourly = snapshot.data[2];
          log(weather.name.toString());
          log(hourly.toString());
          return WeatherScreen(
            weather: weather,
            aqi: aqi,
            hourly: hourly,
          );
        }
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage(logo),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please Wait While We are getting data",
                    style: TextStyle(color: Colors.white),
                  )
                ]),
          ),
        );
      }),
    );
  }
}
