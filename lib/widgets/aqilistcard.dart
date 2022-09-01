import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/utils/constants.dart';

class AQIListCard extends StatelessWidget {
  const AQIListCard({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final String text4;

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
              text1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Row(children: [
              const Image(
                height: 21,
                width: 19,
                image: AssetImage(aqiicon),
              ),
              Text(
                text3,
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
              text2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text4,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.06,
        )
      ],
    );
  }
}
