import 'package:animator_playground/screens/animations/day_night_slider/day_night_slider.dart';
import 'package:animator_playground/screens/animations/watch/watch.dart';
import 'package:animator_playground/screens/animations/send_mail/send_mail.dart';
import 'package:animator_playground/screens/animations/rainy_night/rainy_night.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animator Playground'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: const [
            // Day Night Slider
            _AnimationCell(
              child: DayNightSlider(),
              color: Color(0xffccd0d9),
            ),
            // Watch
            _AnimationCell(
              child: Watch(),
              color: Color(0xff4c4c4c),
            ),
            // Send Mail
            _AnimationCell(
              child: SendMail(),
              color: Color(0xff2b3c4e),
            ),
            // Rainy Night
            _AnimationCell(
              child: RainyNight(),
              color: Color(0xff1a2238),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimationCell extends StatelessWidget {
  final Widget child;
  final Color color;
  
  const _AnimationCell({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child,
      ),
    );
  }
}
