import 'dart:math';

import 'package:flutter/material.dart';

class Droplet extends StatefulWidget {
  final double x, y;
  const Droplet(this.x, this.y, {Key? key}) : super(key: key);

  @override
  State<Droplet> createState() => _DropletState();
}

class _DropletState extends State<Droplet> with SingleTickerProviderStateMixin {
  final double size = (Random().nextInt(3) + 1) * 5;
  late AnimationController _controller;
  late Animation<Alignment> _dropletAnimation;

  Color _getColor() {
    if (size == 5) return const Color(0xFF2D455B);
    if (size == 10) return const Color(0xFF527CA1);
    return const Color(0xFF7FC1F9);
  }

  void _initAnimation() {
    final start = Random().nextDouble();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward(from: start)
      ..repeat();

    _dropletAnimation = Tween<Alignment>(
      begin: Alignment(widget.x, widget.y),
      end: Alignment(widget.x - 1, 1),
    ).animate(
      _controller,
    );
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _dropletAnimation.value,
      child: Transform.rotate(
        angle: -0.3,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: _getColor(),
          ),
        ),
      ),
    );
  }
}
