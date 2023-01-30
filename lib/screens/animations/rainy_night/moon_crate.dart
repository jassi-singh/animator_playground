import 'package:flutter/material.dart';

class MoonCrate extends StatelessWidget {
  final double size;
  final Alignment alignment;
  const MoonCrate({Key? key, required this.size, required this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE6DCA7),
        ),
      ),
    );
  }
}
