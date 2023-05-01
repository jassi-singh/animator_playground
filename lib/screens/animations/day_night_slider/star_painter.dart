import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.4, size.height * 0.4)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.4, size.height * 0.6)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width * 0.6, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width * 0.6, size.height * 0.4)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
