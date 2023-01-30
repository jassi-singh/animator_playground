import 'package:flutter/material.dart';

import 'circle_widget.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bottomCircleAnimation,
      _middleCircleAnimation,
      _topCircleAnimation;

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward()
      ..repeat(
        reverse: true,
      );

    _bottomCircleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOut),
      ),
    );

    _middleCircleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 0.9, curve: Curves.easeOut),
      ),
    );

    _topCircleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.66, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: _bottomCircleAnimation.value,
          child: const CircleWidget(
            size: 210,
          ),
        ),
        Transform.scale(
          scale: _middleCircleAnimation.value,
          child: const CircleWidget(
            size: 140,
          ),
        ),
        Transform.scale(
          scale: _topCircleAnimation.value,
          child: const CircleWidget(
            size: 70,
          ),
        ),
      ],
    );
  }
}
