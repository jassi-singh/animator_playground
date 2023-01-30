import 'dart:math';

import 'package:flutter/material.dart';

import 'horizontal_line.dart';

class MenuIcon extends StatefulWidget {
  const MenuIcon({Key? key}) : super(key: key);
  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topLineAnimation, _bottomLineAnimation;
  late Animation<double> _centerLineAnimation;
  late Animation<double> _rotationAnimation;

  Interval get _firstHalfInterval =>
      const Interval(0.0, 0.5, curve: Curves.easeOut);
  Interval get _secondHalfInterval =>
      const Interval(0.5, 1.0, curve: Curves.easeIn);

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() {
        setState(() {});
      });
    _topLineAnimation =
        Tween(begin: Alignment.topCenter, end: Alignment.center).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _firstHalfInterval,
      ),
    );
    _bottomLineAnimation =
        Tween(begin: Alignment.bottomCenter, end: Alignment.center).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _firstHalfInterval,
      ),
    );
    _centerLineAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _firstHalfInterval,
      ),
    );

    _rotationAnimation = Tween(begin: 0.0, end: pi / 4).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _secondHalfInterval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: SizedBox(
        width: 150,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: _centerLineAnimation.value,
              child: const HorizontalLine(),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Align(
                alignment: _topLineAnimation.value,
                child: const HorizontalLine(),
              ),
            ),
            Transform.rotate(
              angle: -_rotationAnimation.value,
              child: Align(
                alignment: _bottomLineAnimation.value,
                child: const HorizontalLine(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
