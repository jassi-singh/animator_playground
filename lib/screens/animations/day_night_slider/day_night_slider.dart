import 'dart:async';
import 'dart:math';

import 'package:animator_playground/screens/animations/day_night_slider/cloud.dart';
import 'package:animator_playground/screens/animations/day_night_slider/light.dart';
import 'package:animator_playground/screens/animations/day_night_slider/moon.dart';
import 'package:animator_playground/screens/animations/day_night_slider/star.dart';
import 'package:animator_playground/screens/animations/day_night_slider/sun.dart';
import 'package:flutter/material.dart';

class DayNightSlider extends StatefulWidget {
  const DayNightSlider({Key? key}) : super(key: key);

  @override
  State<DayNightSlider> createState() => _DayNightSliderState();
}

class _DayNightSliderState extends State<DayNightSlider>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final List<Animation<Alignment>> _moveAnimation;
  late final Animation<double> _moonAnimation;
  late final Animation<Color?> _skyColorAnimation;
  late final Animation<double> _cloudStarAnimation;

  get _alignmentValue {
    if (_animationController.value < 0.1) {
      return _moveAnimation[0].value;
    } else if (_animationController.value < 0.9) {
      return _moveAnimation[1].value;
    } else {
      return _moveAnimation[2].value;
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _moveAnimation = [
      AlignmentTween(
        begin: Alignment.centerLeft,
        end: const Alignment(-1.1, 0),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0, 0.1),
        ),
      ),
      AlignmentTween(
        begin: const Alignment(-1.1, 0),
        end: const Alignment(1.1, 0),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: const Interval(
            0.1,
            0.9,
            curve: Curves.easeInOut,
          ),
        ),
      ),
      AlignmentTween(
        begin: const Alignment(1.1, 0),
        end: Alignment.centerRight,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.9, 1),
        ),
      ),
    ];

    _moonAnimation = Tween<double>(
      begin: 100,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.9),
      ),
    );

    _skyColorAnimation = ColorTween(
      begin: const Color(0xff3b81b3),
      end: const Color(0xff202234),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.9),
      ),
    );

    _cloudStarAnimation = Tween<double>(
      begin: 0,
      end: 130,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.9),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _changeTheme,
        child: Container(
          width: 330,
          height: 120,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _skyColorAnimation.value,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 5,
                offset: Offset(0, 7),
              ),
              BoxShadow(
                color: Colors.black38,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0, -6),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Cloud(
                x: 20,
                y: 20 - _cloudStarAnimation.value,
                opacity: 0.3,
              ),
              Cloud(
                y: -_cloudStarAnimation.value,
              ),
              Positioned(
                top: -130 + _cloudStarAnimation.value,
                child: SizedBox(
                  width: 330,
                  height: 120,
                  child: Stack(
                    children: const [
                      Star(
                        size: 15,
                        x: 60,
                        y: 10,
                      ),
                      Star(
                        size: 10,
                        x: 8,
                        y: 25,
                      ),
                      Star(
                        size: 12,
                        x: 70,
                        y: 45,
                      ),
                      Star(
                        size: 6,
                        x: 20,
                        y: 80,
                      ),
                      Star(
                        size: 8,
                        x: 40,
                        y: 70,
                      ),
                      Star(
                        size: 15,
                        x: 170,
                        y: 10,
                      ),
                      Star(
                        size: 8,
                        x: 120,
                        y: 25,
                      ),
                      Star(
                        size: 12,
                        x: 150,
                        y: 45,
                      ),
                      Star(
                        size: 6,
                        x: 130,
                        y: 80,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: _alignmentValue,
                width: 330,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Light(size: 180),
                    const Light(size: 260),
                    const Light(size: 340),
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 1,
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(-3, -3),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Stack(
                          children: [
                            const Sun(),
                            Positioned(
                              left: _moonAnimation.value,
                              child: const Moon(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeTheme() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }
}






