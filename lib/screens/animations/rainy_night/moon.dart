import 'package:flutter/material.dart';

import 'moon_crate.dart';

class Moon extends StatelessWidget {
  Moon({Key? key}) : super(key: key);

  final moonCratesList = [
    const MoonCrate(
      size: 20,
      alignment: Alignment(0, -0.6),
    ),
    const MoonCrate(
      size: 18,
      alignment: Alignment(-1.1, -0.3),
    ),
    const MoonCrate(
      size: 15,
      alignment: Alignment(-0.5, 1),
    ),
    const MoonCrate(
      size: 10,
      alignment: Alignment(0.5, -0.2),
    ),
    const MoonCrate(
      size: 8,
      alignment: Alignment(-0.5, -0.3),
    ),
    const MoonCrate(
      size: 10,
      alignment: Alignment(-0.3, 0.3),
    ),
    const MoonCrate(
      size: 12,
      alignment: Alignment(0.5, 0.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Alignment>(
      tween: Tween<Alignment>(
        begin: const Alignment(-0.5, 1),
        end: const Alignment(-0.5, -0.7),
      ),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, _) {
        return Align(
          alignment: value,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFF6EDBD),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFACA783),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Stack(
                children: [
                  const SizedBox(),
                  ...moonCratesList,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
