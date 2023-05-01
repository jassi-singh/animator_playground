import 'dart:async';
import 'dart:math';

import 'package:animator_playground/screens/animations/day_night_slider/star_painter.dart';
import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  final double size;
  final double x;
  final double y;
  const Star({
    Key? key,
    required this.size,
    this.x = 0,
    this.y = 0,
  }) : super(key: key);

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Timer _periodicTimer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    _scaleAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);

    final _rndm = Random().nextInt(5);
    _periodicTimer = Timer.periodic(Duration(seconds: 5 + _rndm), (timer) {
      _animationController.reset();
      _animationController.forward().then(
            (_) => _animationController.reverse(),
          );
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _periodicTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.x,
      top: widget.y,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: CustomPaint(
          size: Size.square(widget.size),
          painter: StarPainter(),
        ),
      ),
    );
  }
}
