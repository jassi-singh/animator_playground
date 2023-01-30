import 'package:flutter/widgets.dart';

class Cloud extends StatelessWidget {
  final double size;
  final Alignment alignment;
  final Color color;
  const Cloud(
      {Key? key,
      required this.size,
      required this.alignment,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
