import 'package:flutter/material.dart';

class Balls extends StatefulWidget {
  final double time;

  const Balls({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<Balls> createState() => _BallsState();
}

class _BallsState extends State<Balls> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        microseconds: (widget.time * 1000000).toInt(),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward()
      ..repeat(reverse: true);

    _animation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 300,
        child: Align(
          alignment: _animation.value,
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
