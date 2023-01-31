import 'package:flutter/material.dart';

class PumpingHeart extends StatefulWidget {
  const PumpingHeart({
    Key? key,
  }) : super(key: key);

  @override
  State<PumpingHeart> createState() => _PumpingHeartState();
}

class _PumpingHeartState extends State<PumpingHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward()
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 13, end: 18).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
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
    return SizedBox(
      width: 20,
      height: 20,
      child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: _animation.value,
      ),
    );
  }
}
