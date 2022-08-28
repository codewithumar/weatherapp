import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/screens/sevendayforcastscreen.dart';
import 'package:weatherapp/widgets/listcard.dart';
import 'package:weatherapp/widgets/threedayforcast.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/2.png"),
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
                  height: MediaQuery.of(context).size.height * 1.3,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.04,
                  child: Text(
                    'Lahore',
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
                      prefix: const Text("                           "),
                      hintText: "Search Cities",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      prefixIcon: const Image(
                          image: AssetImage("lib/images/search.png")),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 135,
                  child: Text(
                    "37",
                    style:
                        GoogleFonts.cairo(fontSize: 120, color: Colors.white),
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
                  left: 185,
                  top: 320,
                  child: Text(
                    'Clear',
                    style: GoogleFonts.cairo(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 180,
                  top: 355,
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
                              AssetImage("lib/images/AQI.png"),
                              color: Colors.white,
                              size: 23,
                            ),
                            Text(
                              'AQI',
                              style: GoogleFonts.cairo(
                                  fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              '13',
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
                  top: MediaQuery.of(context).size.height * 0.71,
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
                            builder: (context) => const SevenDayForcatScreen(),
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
                  top: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(125, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: const [
                        ThreeDayForcast(),
                        ThreeDayForcast(),
                        ThreeDayForcast(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(125, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: const [
                        ListCard(
                            title1: 'Real Feel',
                            title2: 'Humadity',
                            title3: '32',
                            title4: '62%'),
                        ListCard(
                            title1: 'Real Feel',
                            title2: 'Humadity',
                            title3: '32',
                            title4: '62%'),
                        ListCard(
                            title1: 'Real Feel',
                            title2: 'Humadity',
                            title3: '32',
                            title4: '62%'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 1.11,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    //width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(125, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: const [
                        ListCard(
                            title1: "text1",
                            title2: 'text2',
                            title3: 'text3',
                            title4: 'text4')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
