import 'package:flutter/material.dart';

import 'weather_info.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: const [
            Text(
              '12° ',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w200,
              ),
            ),
            WeatherInfo(
              text1: "Wind: E 7 km/h",
              text2: "Humidity: 80%",
            ),
            WeatherInfo(
              text1: "Tue: 21° / 9°",
              text2: "Wed: 23° / 9°",
              isEnd: true,
            ),
          ],
        ),
      ),
    );
  }
}
