import 'package:animator_playground/screens/animations/day_night_slider/cloud_painter.dart';
import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final double y;
  final double x;
  final double opacity;
  const Cloud({
    Key? key,
    this.y = 0,
    this.x = 0,
    this.opacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -12 - x,
      top: -12 - y,
      child: CustomPaint(
        painter: CloudPainter(
          opacity: opacity,
        ),
        size: const Size(330, 120),
      ),
    );
  }
}
