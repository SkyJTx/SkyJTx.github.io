import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget? child;
  final List<Color> colors;
  final Duration duration;
  final Curve curve;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const AnimatedBackground({
    super.key,
    this.child,
    required this.colors,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.linear,
    this.begin = Alignment.bottomLeft,
    this.end = Alignment.topRight,
  });

  @override
  State<AnimatedBackground> createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground> {
  late Timer timer;
  int index = 0;

  @override
  void initState() {
    timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        index = (index + 1) % widget.colors.length;
      });
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        index = (index + 1) % widget.colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      curve: widget.curve,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: widget.begin,
          end: widget.end,
          colors: [
            for (int i = 0; i < widget.colors.length; i++)
              widget.colors[(index + i) % widget.colors.length],
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
