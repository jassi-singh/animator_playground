import 'dart:math';

import 'package:animator_playground/screens/animations/rainy_night/droplet.dart';
import 'package:flutter/material.dart';

class Rain extends StatelessWidget {
  Rain({Key? key}) : super(key: key);

  final _dropletsList =
      List.generate(50, (index) => Droplet(Random().nextDouble() * 3 - 1, -1));
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _dropletsList,
    );
  }
}
