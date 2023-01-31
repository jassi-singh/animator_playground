import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget>
    with SingleTickerProviderStateMixin {
  DateTime _dateTime = DateTime.now();
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..addListener(() {
        setState(() {
          _dateTime = DateTime.now();
        });
      })
      ..forward()
      ..repeat();
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
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        DateFormat('HH:mm').format(_dateTime),
        style: const TextStyle(
          fontSize: 64,
          color: Colors.white,
        ),
      ),
    );
  }
}

