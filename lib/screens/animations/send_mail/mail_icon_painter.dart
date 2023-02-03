import 'dart:ui';
import 'package:flutter/material.dart';

class MailIconPainter extends CustomPainter {
  final double progress;
  const MailIconPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final path1 = Path()
      ..moveTo(100, -50)
      ..lineTo(0, 0)
      ..lineTo(-100, -50)
      ..close();

    final path2 = Path()
      ..moveTo(100, -50)
      ..lineTo(100, 50)
      ..lineTo(-100, 50)
      ..lineTo(-100, -50);

    PathMetrics pathMetrics = path1.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath =
          pathMetric.extractPath(0, pathMetric.length * progress);
      canvas.drawPath(extractPath, paint);
    }

    pathMetrics = path2.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath =
          pathMetric.extractPath(0, pathMetric.length * progress);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
