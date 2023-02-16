import 'dart:math';

import 'package:flutter/material.dart';

class RotatingSquares extends StatefulWidget {
  const RotatingSquares({Key? key}) : super(key: key);

  @override
  State<RotatingSquares> createState() => _RotatingSquaresState();
}

class _RotatingSquaresState extends State<RotatingSquares> {
  final colorsList = const [
    Color(0xFF631e92),
    Color(0xFF7725b4),
    Color(0xFF8124ca),
    Color(0xFF9f3aec),
    Color(0xFFb15ff8),
    Color(0xFFc68ffb),
    Color(0xFFddbdff),
    Color(0xFFebd7ff),
    Color(0xFFf5ecff),
  ];

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => setState(() {
        x += details.delta.dy * 0.01;
        y += details.delta.dx * 0.01;
      }),
      child: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.003)
            ..rotateX(x)
            ..rotateY(y),
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(
              9,
              (index) => CircleSqurare(
                size: 35.00 * (9 - index),
                color: colorsList[index],
                minRadius: 30.00 - 3.5 * index,
                maxRotation: 5 * pi / 4 - pi / 9 * (8 - index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleSqurare extends StatefulWidget {
  final double size;
  final Color color;
  final double minRadius;
  final double maxRotation;
  const CircleSqurare({
    Key? key,
    required this.size,
    required this.color,
    required this.minRadius,
    required this.maxRotation,
  }) : super(key: key);

  @override
  State<CircleSqurare> createState() => _CircleSqurareState();
}

class _CircleSqurareState extends State<CircleSqurare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shapeAnimation;
  late Animation<double> _rotationAnimation;

  Animation<double> get _curvedAnimation => CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      );

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..addStatusListener((status) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });
      })
      ..addListener(() {
        setState(() {});
      })
      ..forward();

    _shapeAnimation =
        Tween<double>(begin: widget.size / 2, end: widget.minRadius).animate(
      _curvedAnimation,
    );
    _rotationAnimation =
        Tween<double>(begin: 0, end: widget.maxRotation).animate(
      _curvedAnimation,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotationAnimation.value,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(_shapeAnimation.value),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2 * _controller.value),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
