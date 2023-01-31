import 'dart:math';

import 'package:flutter/material.dart';

class DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 1;

    _drawCircularDots(canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawCircularDots(Canvas canvas, Size size, Paint paint) {
    double radius = 0.5 * size.width;

    // Draw the dots
    for (int i = 0; i < 60; i++) {
      double angle = 2 * pi * i / 60;
      double dx = radius * (cos(angle) + 1);
      double dy = radius * (sin(angle) + 1);
      canvas.drawCircle(Offset(dx, dy), 1.5, paint);
    }
  }
}
