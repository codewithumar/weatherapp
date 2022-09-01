// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants.dart';

class SevenDayCard extends StatelessWidget {
  SevenDayCard(
      {Key? key,
      required this.date,
      required this.day,
      required this.iconfromapi,
      required this.temp})
      : super(key: key);
  String day;
  String date;
  String temp;
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.17,
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
            ),
          ),
          Image.asset(
            icon,
            height: 50,
            width: 50,
          ),
          Text(
            temp,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
