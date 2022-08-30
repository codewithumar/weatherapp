import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/constants.dart';

import 'package:weatherapp/models/weather_api.dart';
import 'package:weatherapp/screens/sevendayforcastscreen.dart';
import 'package:weatherapp/widgets/dailyforcast.dart';
import 'package:weatherapp/widgets/dailyweathercard.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/widgets/aqilistcard.dart';
import 'package:weatherapp/widgets/threedayforcast.dart';

// ignore: must_be_immutable
class WeatherScreen extends StatefulWidget {
  WeatherScreen({
    Key? key,
    required this.weather,
    required this.aqi,
    required this.hourly,
  }) : super(key: key);
  WeatherAPIModel weather;
  AQI aqi;
  ForecastHourly hourly;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String backgroundimage = "lib/images/clear.png";

  late final backgroundfromapi = widget.weather.weather![0].main;

  @override
  Widget build(BuildContext context) {
    if (backgroundfromapi == "Clouds") {
      backgroundimage = cloudsbackground;
    } else if (backgroundfromapi == "Thunderstorm") {
      backgroundimage = thenderstormbackground;
    } else if (backgroundfromapi == "Rain") {
      backgroundimage = rainybackground;
    } else if (backgroundfromapi == "Clear") {
      backgroundimage = clearbackground;
    }
    //  log(widget.hourly.hourly[2].main!.tempMin.toString());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundimage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 1.5,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.06,
                child: Text(
                  widget.weather.name.toString(),
                  style: GoogleFonts.cairo(fontSize: 24, color: Colors.white),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width - 30,
                height: 36,
                top: MediaQuery.of(context).size.height * 0.12,
                left: MediaQuery.of(context).size.width * 0.04,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(231, 230, 230, 1),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    prefixIconColor: const Color.fromRGBO(69, 65, 65, 1),
                    hintText: "Search Cities",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    prefixIcon:
                        const Image(image: AssetImage("lib/images/search.png")),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                left: 135,
                child: Text(
                  widget.weather.main!.temp!.round().toString(),
                  style: GoogleFonts.cairo(fontSize: 120, color: Colors.white),
                ),
              ),
              Positioned(
                top: 185,
                left: 270,
                child: Text(
                  "°C",
                  style: GoogleFonts.cairo(
                    fontSize: 42,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.46,
                top: MediaQuery.of(context).size.height * 0.40,
                child: Text(
                  widget.weather.weather![0].main.toString(),
                  style: GoogleFonts.cairo(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.427,
                top: MediaQuery.of(context).size.height * 0.44,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white12,
                      ),
                      height: 25,
                      width: 60,
                      child: Row(
                        children: [
                          const ImageIcon(
                            AssetImage(aqiicon),
                            color: Colors.white,
                            size: 23,
                          ),
                          Text(
                            "AQI ",
                            style: GoogleFonts.cairo(
                                fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            widget.aqi.main![0].aqi.toString(),
                            style: GoogleFonts.cairo(
                                fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DailyWeatherCard(
                      time: "Now",
                      iconfromapi:
                          widget.hourly.hourly[0].weather![0].main.toString(),
                      temp: widget.hourly.hourly[0].main!.temp!
                          .round()
                          .toString(),
                      windspeed: widget.hourly.hourly[0].wind!.speed.toString(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DailyWeatherCard(
                      time: convertmillisectodate(widget.hourly.hourly[0].dt!)
                          .toString(),
                      iconfromapi:
                          widget.hourly.hourly[0].weather![0].main.toString(),
                      temp: widget.hourly.hourly[0].main!.temp!
                          .round()
                          .toString(),
                      windspeed: widget.hourly.hourly[0].wind!.speed.toString(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DailyWeatherCard(
                      time: convertmillisectodate(widget.hourly.hourly[1].dt!)
                          .toString(),
                      iconfromapi:
                          widget.hourly.hourly[1].weather![0].main.toString(),
                      temp: widget.hourly.hourly[1].main!.temp!
                          .round()
                          .toString(),
                      windspeed: widget.hourly.hourly[1].wind!.speed.toString(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DailyWeatherCard(
                      time: convertmillisectodate(widget.hourly.hourly[2].dt!)
                          .toString(),
                      iconfromapi:
                          widget.hourly.hourly[2].weather![0].main.toString(),
                      temp: widget.hourly.hourly[2].main!.temp!
                          .round()
                          .toString(),
                      windspeed: widget.hourly.hourly[2].wind!.speed.toString(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DailyWeatherCard(
                      time: convertmillisectodate(widget.hourly.hourly[3].dt!)
                          .toString(),
                      iconfromapi:
                          widget.hourly.hourly[3].weather![0].main.toString(),
                      temp: widget.hourly.hourly[3].main!.temp!
                          .round()
                          .toString(),
                      windspeed: widget.hourly.hourly[3].wind!.speed.toString(),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(125, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      ThreeDayForcast(
                        day: "Today",
                        weatherstatus: widget
                            .hourly.hourly[0].weather![0].description
                            .toString(),
                        tempraturemax:
                            "${widget.hourly.hourly[0].main!.tempMax!.round().toString()}°",
                        tempraturemin:
                            "${widget.hourly.hourly[0].main!.tempMin!.round().toString()}°",
                        iconfromapi:
                            widget.hourly.hourly[0].weather![0].main.toString(),
                      ),
                      ThreeDayForcast(
                        day: "Tommorrw",
                        weatherstatus: widget
                            .hourly.hourly[1].weather![0].description
                            .toString(),
                        tempraturemax:
                            "${widget.hourly.hourly[1].main!.tempMax!.round().toString()}°",
                        tempraturemin:
                            "${widget.hourly.hourly[1].main!.tempMin!.round().toString()}°",
                        iconfromapi:
                            widget.hourly.hourly[1].weather![0].main.toString(),
                      ),
                      ThreeDayForcast(
                        day: convertmillisectoday(widget.hourly.hourly[2].dt!)
                            .toString(),
                        weatherstatus: widget
                            .hourly.hourly[2].weather![0].description
                            .toString(),
                        tempraturemax:
                            "${widget.hourly.hourly[2].main!.tempMax!.round().toString()}°",
                        tempraturemin:
                            "${widget.hourly.hourly[2].main!.tempMin!.round().toString()}°",
                        iconfromapi:
                            widget.hourly.hourly[2].weather![0].main.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.88,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(125, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SevenDayForcatScreen(
                            aqi: widget.aqi,
                            weather: widget.weather,
                            hourly: widget.hourly,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      '7 Day Forcast',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.98,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(125, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      DailyForecast(
                          title1: 'Real Feel',
                          title2: 'Humadity',
                          title3: widget.weather.main!.feelsLike!
                              .round()
                              .toString(),
                          title4:
                              "${widget.weather.main!.humidity.toString()}%"),
                      DailyForecast(
                          title1: 'Chance of rain',
                          title2: 'Pressure',
                          title3: '32',
                          title4:
                              '${(widget.weather.main!.pressure! / 1013.2).round()} atm'),
                      DailyForecast(
                          title1: 'Wind speed',
                          title2: 'UV index',
                          title3:
                              '${widget.weather.wind!.speed.toString()} km/h',
                          title4: '7'),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 1.3,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  //width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(125, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      AQIListCard(
                          text1: "Air Quality Index",
                          text2: '',
                          text3: widget.aqi.main![0].aqi.toString(),
                          text4: 'Full air quality forecasts')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String convertmillisectoday(int dt) {
    var time = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

    var date = DateFormat('E').format(time);
    return date;
  }

  String convertmillisectodate(int dt) {
    var time = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

    var date = DateFormat('HH:mm').format(time);
    return date;
  }
}
