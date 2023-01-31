import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInfo extends StatelessWidget {
  const DateInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('EEE dd MMM yyyy').format(DateTime.now()),
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
