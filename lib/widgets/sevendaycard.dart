import 'package:flutter/material.dart';

class SevenDayCard extends StatelessWidget {
  const SevenDayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'day',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const Text(
          'Temps',
          style: TextStyle(
            color: Colors.white,
            fontSize: 9,
          ),
        ),
        Image.asset(
          'lib/images/AQI.png',
          height: 50,
          width: 50,
        ),
        const Text(
          "temp3",
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
