import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String text1, text2;
  final bool isEnd;
  const WeatherInfo({
    Key? key,
    required this.text1,
    required this.text2,
    this.isEnd = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
