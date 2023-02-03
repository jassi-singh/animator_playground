import 'package:flutter/material.dart';

class AnimationInfo {
  final String title;
  final String description;
  final AnimationType animationType;
  final Color color;

  AnimationInfo({
    required this.title,
    required this.description,
    required this.animationType,
    required this.color,
  });
}

enum AnimationType {
  menuIcon,
  loading,
  rainyNight,
  watch,
  pacman,
  sendMail,
}
