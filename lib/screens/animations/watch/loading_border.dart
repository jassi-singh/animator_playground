import 'dart:math';

import 'package:flutter/material.dart';

import 'empty_painter.dart';
import 'fill_painter.dart';

class LoadingBorder extends StatefulWidget {
  const LoadingBorder({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingBorder> createState() => _LoadingBorderState();
}

class _LoadingBorderState extends State<LoadingBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fillAnimation, _emptyAnimation;

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward()
      ..repeat();
    _fillAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.5,
        ),
      ),
    );

    _emptyAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1,
        ),
      ),
    );
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 308,
          width: 308,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: FillPainter(_fillAnimation.value),
            ),
          ),
        ),
        SizedBox(
          height: 308,
          width: 308,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: EmptyPainter(_emptyAnimation.value),
            ),
          ),
        ),
      ],
    );
  }
}


