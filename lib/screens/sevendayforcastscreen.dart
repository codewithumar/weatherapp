import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SevenDayForcatScreen extends StatefulWidget {
  const SevenDayForcatScreen({Key? key}) : super(key: key);

  @override
  State<SevenDayForcatScreen> createState() => _SevenDayForcatScreenState();
}

class _SevenDayForcatScreenState extends State<SevenDayForcatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seven Day Forcast'),
      ),
    );
  }
}
