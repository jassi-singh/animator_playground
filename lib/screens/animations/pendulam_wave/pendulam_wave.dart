import 'package:flutter/material.dart';

import 'balls.dart';

class PendulamWave extends StatelessWidget {
  const PendulamWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int numberOfBalls = 20, duration = 60, oscillation = 40;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          numberOfBalls,
          (index) => Balls(
            time: duration / (oscillation + numberOfBalls - index - 1),
          ),
        ),
      ),
    );
  }
}

