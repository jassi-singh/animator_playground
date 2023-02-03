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
  AnimationInfo(
    title: 'Watch',
    description:
        'Classic, noble, modern or playful? What do you want your favorite watch to look like?',
    animationType: AnimationType.watch,
    color: const Color(0xff4c4c4c),
  ),
  AnimationInfo(
    title: 'Pac-Man',
    description:
        'The classic arcade game is still a lot of fun. The ghosts are chasing you, but you can eat them.',
    animationType: AnimationType.pacman,
    color: const Color(0xff2c2e2e),
  ),
  AnimationInfo(
    title: 'Send Mail',
    description:
        'Surprise your visitors with a nice animation instead of a simple "request sent".',
    animationType: AnimationType.sendMail,
    color: const Color(0xff2b3c4e),
  ),
  AnimationInfo(
    title: 'Pendulam Wave',
    description:
        "If you are not yet fascinated by mathematics, you should be now at the latest. Wonderful what a small calculations brings forth.",
    animationType: AnimationType.pendulumWave,
    color: const Color(0xff4c4ba2),
  )
];
