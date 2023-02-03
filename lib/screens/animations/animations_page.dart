import 'package:animator_playground/models/animation_model.dart';
import 'package:animator_playground/screens/animations/pacman/pacman.dart';
import 'package:animator_playground/screens/animations/pendulam_wave/pendulam_wave.dart';
import 'package:animator_playground/screens/animations/rainy_night/rainy_night.dart';
import 'package:animator_playground/screens/animations/send_mail/send_mail.dart';
import 'package:animator_playground/screens/animations/watch/watch.dart';
import 'package:flutter/material.dart';

import 'loading/loading.dart';
import 'menu_icon/menu_icon.dart';

class AnimationsPage extends StatelessWidget {
  final AnimationInfo animationInfo;
  const AnimationsPage({Key? key, required this.animationInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationInfo.color,
      body: Stack(
        children: [
          SafeArea(
            child: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          _showAnimation(animationInfo.animationType),
        ],
      ),
    );
  }

  Widget _showAnimation(AnimationType animationType) {
    switch (animationType) {
      case AnimationType.menuIcon:
        return const MenuIcon();
      case AnimationType.loading:
        return const LoadingAnimation();
      case AnimationType.rainyNight:
        return const RainyNight();
      case AnimationType.watch:
        return const Watch();
      case AnimationType.pacman:
        return const Pacman();
      case AnimationType.sendMail:
        return const SendMail();
      case AnimationType.pendulumWave:
        return const PendulamWave();
      default:
        return const MenuIcon();
    }
  }
}
