import 'package:flutter/material.dart';

import 'date_info.dart';
import 'dotted_border.dart';
import 'health_widget.dart';
import 'loading_border.dart';
import 'time_widget.dart';

class Watch extends StatelessWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 350,
            width: 350,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xff242424),
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  width: 10,
                  color: Color(0xff3a3a3a),
                ),
              ),
            ),
            child: SizedBox(
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  DateInfo(),
                  TimeWidget(),
                  HealthWidget(),
                ],
              ),
            ),
          ),
          const DottedBorder(),
          const LoadingBorder()
        ],
      ),
    );
  }
}
