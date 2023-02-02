import 'dart:math';

import 'package:flutter/material.dart';

class Pacman extends StatelessWidget {
  const Pacman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(left: 30),
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.2, -0.5),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xff2c2e2e),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const PacmanMouth(),
              ],
            ),
          ),
        ),
        const Foods(),
      ],
    );
  }
}

class Foods extends StatefulWidget {
  const Foods({Key? key}) : super(key: key);

  @override
  _FoodsState createState() => _FoodsState();
}

class _FoodsState extends State<Foods> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward()
      ..repeat();

    _animation = Tween<Alignment>(
      begin: Alignment.centerRight,
      end: const Alignment(-0.8, 0),
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: _animation.value, child: const Food());
  }
}

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
    );
  }
}

class PacmanMouth extends StatefulWidget {
  const PacmanMouth({
    Key? key,
  }) : super(key: key);

  @override
  State<PacmanMouth> createState() => _PacmanMouthState();
}

class _PacmanMouthState extends State<PacmanMouth>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward()
      ..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: pi / 6).animate(_controller);
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
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: PacmanMouthPainter(_animation.value),
      ),
    );
  }
}

class PacmanMouthPainter extends CustomPainter {
  final double angle;
  const PacmanMouthPainter(this.angle) : super();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff2c2e2e)
      // ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 5;

    final double radius = 0.5 * size.width;
    canvas.drawArc(
        Rect.fromCircle(
          center: Offset(radius, radius),
          radius: radius + 1,
        ),
        -angle,
        2 * angle,
        true,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
