import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  final double opacity;
  const CloudPainter({this.opacity = 1});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.7,
        size.width * 0.35,
        size.height * 0.85,
      )
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.55,
        size.width * 0.55,
        size.height * 0.85,
      )
      ..quadraticBezierTo(
        size.width * 0.6,
        size.height * 0.75,
        size.width * 0.65,
        size.height * 0.85,
      )
      ..quadraticBezierTo(
        size.width * 0.7,
        size.height * 0.6,
        size.width * 0.8,
        size.height * 0.7,
      )
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.5,
        size.width * 0.88,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.85,
        size.height * 0,
        1.1 * size.width,
        size.height * 0.1,
      )
      ..lineTo(1.1 * size.width, 0)
      ..lineTo(1.1 * size.width, 1.2 * size.height)
      ..lineTo(0, 1.2 * size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

