import 'dart:ui';

import 'package:flutter/material.dart';

class ThreeDayForcast extends StatelessWidget {
  const ThreeDayForcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            const SizedBox(
                height: 50,
                width: 50,
                child: Image(
                  image: AssetImage(
                    "lib/images/AQI.png",
                  ),
                )),
            const Text(
              "day - weatherMain",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            const Text(
              'temp',
              style: TextStyle(
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
