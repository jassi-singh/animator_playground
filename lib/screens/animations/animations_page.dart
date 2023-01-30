import 'package:animator_playground/models/animation_model.dart';
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
          Center(
            child: _showAnimation(animationInfo.animationType),
          ),
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
      default:
        return const MenuIcon();
    }
  }
}
