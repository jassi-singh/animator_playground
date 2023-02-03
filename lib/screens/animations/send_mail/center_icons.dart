import 'package:animator_playground/screens/animations/send_mail/bloc/button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mail_icon_painter.dart';
import 'plain_painter.dart';

class CenterIcons extends StatefulWidget {
  const CenterIcons({
    Key? key,
  }) : super(key: key);

  @override
  State<CenterIcons> createState() => _CenterIconsState();
}

class _CenterIconsState extends State<CenterIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _mailAnimation, _planeAnimation1, _planeAnimation2;
  late Animation<double> _innerCircleAnimation1,
      _innerCircleAnimation2,
      _outerCircleAnimation;

  double get _innerCircleSize => _controller.value < 0.1
      ? _innerCircleAnimation1.value
      : _innerCircleAnimation2.value;

  Alignment get _planeCoordinates {
    if (_controller.value > 0.7) {
      if (_controller.value > 0.8) {
        return const Alignment(3.5, -2);
      }
      return const Alignment(-0.5, 0.5);
    }
    return Alignment.center;
  }

  double get _planeSize => _controller.value < 0.8 ? 1 : 0.3;

  double get _planeOpacity => _controller.value < 0.8 ? 1 : 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });

    _mailAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.35),
      ),
    );

    _planeAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.7),
      ),
    );

    _planeAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.55),
      ),
    );

    _innerCircleAnimation1 = Tween<double>(begin: 350, end: 400).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.1),
      ),
    );

    _innerCircleAnimation2 = Tween<double>(begin: 400, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.5),
      ),
    );

    _outerCircleAnimation = Tween<double>(begin: 350, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.5),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonBloc, ButtonState>(
      listener: (context, state) {
        if (state is LoadingState) {
          _controller.forward().whenComplete(
                () => context.read<ButtonBloc>().add(CompletedEvent()),
              );
        } else if (state is InitialState) {
          _controller.reset();
        }
      },
      child: SizedBox(
        height: 450,
        width: 450,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: _outerCircleAnimation.value,
              height: _outerCircleAnimation.value,
              decoration: BoxDecoration(
                color: const Color(0xff273548),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff334a5c),
                  width: 10,
                ),
              ),
            ),
            Container(
              width: _innerCircleSize,
              height: _innerCircleSize,
              decoration: const BoxDecoration(
                color: Color(0xff334a5c),
                shape: BoxShape.circle,
              ),
            ),
            if (_controller.value < 0.36)
              RepaintBoundary(
                child: CustomPaint(
                  painter: MailIconPainter(_mailAnimation.value),
                ),
              ),
            if (_controller.value > 0.24)
              AnimatedScale(
                scale: _planeSize,
                duration: const Duration(milliseconds: 900),
                child: AnimatedOpacity(
                  opacity: _planeOpacity,
                  duration: const Duration(milliseconds: 900),
                  child: AnimatedAlign(
                    alignment: _planeCoordinates,
                    duration: const Duration(milliseconds: 900),
                    child: RepaintBoundary(
                      child: CustomPaint(
                        painter: PlaneIconPainter(
                            _planeAnimation1.value, _planeAnimation2.value),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
