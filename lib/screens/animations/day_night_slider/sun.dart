import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.yellow.shade600,
        shape: BoxShape.circle,
      ),
    );
  }
}
