import 'package:flutter/material.dart';

import 'dotted_painter.dart';

class DottedBorder extends StatelessWidget {
  const DottedBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 280,
      child: RepaintBoundary(
        child: CustomPaint(
          painter: DottedPainter(),
        ),
      ),
    );
  }
}

