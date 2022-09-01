import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({
    Key? key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  }) : super(key: key);

  final String title1;
  final String title2;
  final String title3;
  final String title4;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Row(children: [
              Text(
                title3,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                )),
              ),
            ]),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title4,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width * 0.06,
        ),
      ],
    );
  }
}
