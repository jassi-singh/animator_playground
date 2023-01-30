import 'package:flutter/material.dart';

import 'cloud.dart';

class Clouds extends StatelessWidget {
  Clouds({Key? key}) : super(key: key);

  final cloudsList = [
    const Cloud(
      size: 300,
      alignment: Alignment(-1.5, 1.5),
      color: Color(0xFF26314F),
    ),
    const Cloud(
      size: 300,
      alignment: Alignment(2, 1.6),
      color: Color(0xFF26314F),
    ),
    const Cloud(
      size: 200,
      alignment: Alignment(-1.3, 1),
      color: Color(0xFF2F3C5E),
    ),
    const Cloud(
      size: 300,
      alignment: Alignment(0.3, 2),
      color: Color(0xFF2F3C5E),
    ),
    const Cloud(
      size: 200,
      alignment: Alignment(1.5, 1.1),
      color: Color(0xFF2F3C5E),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Stack(
          children: [const SizedBox(), ...cloudsList],
        ),
      ),
    );
  }
}
