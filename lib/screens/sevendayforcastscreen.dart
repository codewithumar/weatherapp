import 'package:flutter/material.dart';

class SevenDayForcatScreen extends StatelessWidget {
  const SevenDayForcatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 27, 116, 199),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(248, 27, 116, 199),
        title: const Text('Seven Day Forcast'),
      ),
    );
  }
}
