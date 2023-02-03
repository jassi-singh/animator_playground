import 'dart:ui';

import 'package:flutter/material.dart';

class PlaneIconPainter extends CustomPainter {
  final double progress1, progress2;
  const PlaneIconPainter(this.progress1, this.progress2);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final path1 = Path()
      ..moveTo(100, -50)
      ..lineTo(-140, 60)
      ..lineTo(90, 90)
      ..close();

    final path2 = Path()
      ..moveTo(100, -50)
      ..lineTo(-40, 70)
      ..lineTo(-40, 150)
      ..lineTo(20, 82);

    PathMetrics pathMetrics = path1.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath =
          pathMetric.extractPath(0, pathMetric.length * progress1);
      canvas.drawPath(extractPath, paint);
    }

    pathMetrics = path2.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath =
          pathMetric.extractPath(0, pathMetric.length * progress2);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
