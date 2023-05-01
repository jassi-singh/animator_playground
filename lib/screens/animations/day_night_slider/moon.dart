import 'package:animator_playground/screens/animations/day_night_slider/moon_crate.dart';
import 'package:flutter/material.dart';

class Moon extends StatelessWidget {
  const Moon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffccd0d9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Stack(
        children: const [
          MoonCrate(
            left: 40,
            top: 10,
            size: 20,
          ),
          MoonCrate(
            left: 15,
            top: 35,
            size: 35,
          ),
          MoonCrate(
            left: 55,
            top: 60,
            size: 25,
          ),
        ],
      ),
    );
  }
}
