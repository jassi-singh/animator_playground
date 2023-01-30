import 'dart:math';

import 'package:flutter/material.dart';

import 'clouds.dart';
import 'moon.dart';
import 'rain.dart';
import 'weather_data.dart';

class RainyNight extends StatelessWidget {
  const RainyNight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Stack(
        children: [
          const SizedBox(),
          Moon(),
          Clouds(),
          Rain(),
          const WeatherData(),
        ],
      ),
    );
  }
}
