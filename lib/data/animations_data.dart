import 'package:animator_playground/models/animation_model.dart';
import 'package:flutter/material.dart';

final animationsList = [
  AnimationInfo(
    title: 'Menu Item',
    description:
        'Used on almost every website by now, simple but impressively animated it becomes a real eye-catcher',
    animationType: AnimationType.menuIcon,
    color: const Color(0xff3faf82),
  ),
  AnimationInfo(
    title: 'Loading',
    description:
        'The best are always websites that do not need a loading status. If they do, here would be a calming one.',
    animationType: AnimationType.loading,
    color: const Color(0xffe56262),
  ),
  AnimationInfo(
    title: 'Rainy Night',
    description:
        'The perfect time of day and the perfect weather to program in peace. The raindrops even shatter on the ground.',
    animationType: AnimationType.rainyNight,
    color: const Color(0xff1a2238),
  ),
];
