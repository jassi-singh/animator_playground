import 'package:flutter/material.dart';

class MoonCrate extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  const MoonCrate({
    Key? key,
    required this.left,
    required this.top,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xffa2a8bd),
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(-2, -2),
            ),
          ],
        ),
      ),
    );
  }
}
