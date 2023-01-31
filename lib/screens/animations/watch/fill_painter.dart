import 'dart:math';

import 'package:flutter/material.dart';

class FillPainter extends CustomPainter {
  final double angle;
  const FillPainter(this.angle);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 5;

    _drawArc(canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawArc(Canvas canvas, Size size, Paint paint) {
    double radius = 0.5 * size.width;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -pi / 2,
      angle,
      false,
      paint,
    );
  }
}

