// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/constants.dart';

class ThreeDayForcast extends StatelessWidget {
  ThreeDayForcast(
      {Key? key,
      required this.day,
      required this.iconfromapi,
      required this.tempraturemin,
      required this.weatherstatus,
      required this.tempraturemax})
      : super(key: key);
  String day;
  String weatherstatus;
  String iconfromapi;
  String tempraturemin;
  String tempraturemax;

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
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            SizedBox(
                height: 50,
                width: 50,
                child: Image(
                  image: AssetImage(
                    icon,
                  ),
                )),
            Text(
              "$day $weatherstatus",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Text(
              '$tempraturemin / $tempraturemax',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.07)
          ],
        ),
      ),
    );
  }
}
