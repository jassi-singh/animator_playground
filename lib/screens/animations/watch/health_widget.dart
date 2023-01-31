import 'package:flutter/material.dart';

import 'pumping_heart.dart';

class HealthWidget extends StatelessWidget {
  const HealthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        PumpingHeart(),
        Expanded(
          child: Text(
            ' 80',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '1248 KCAL',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
