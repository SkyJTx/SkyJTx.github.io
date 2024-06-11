import 'dart:async';

import 'package:flutter/material.dart';

class CustomWellBox extends StatefulWidget {
  final double width;
  final double height;
  final Widget label;
  final Widget? child;
  final FutureOr<void> Function(bool)? onHover;
  final FutureOr<void> Function()? onTap;
  final FutureOr<void> Function()? onDoubleTap;
  final FutureOr<void> Function()? onLongPress;
  final BoxDecoration? decoration;

  const CustomWellBox({
    super.key,
    required this.width,
    required this.height,
    required this.label,
    this.decoration,
    this.onHover,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return CustomWellBoxState();
  }
}

class CustomWellBoxState extends State<CustomWellBox> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  final duration = const Duration(milliseconds: 200);
  final curve = Curves.easeInOutCubic;
  final scaleTween = Tween<double>(begin: 1, end: 1.2);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    final animator = CurvedAnimation(
      parent: controller,
      curve: curve,
    );
    scaleAnimation = scaleTween.animate(animator);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        widget.decoration?.borderRadius?.resolve(TextDirection.ltr) ?? BorderRadius.circular(8);
    return InkWell(
      borderRadius: borderRadius,
      onHover: (value) {
        if (value) {
          controller.forward();
        } else {
          controller.reverse();
        }
        widget.onHover?.call(value);
      },
      onTap: widget.onTap != null ? () => widget.onTap?.call() : () {},
      onDoubleTap: widget.onDoubleTap != null ? () => widget.onDoubleTap?.call() : null,
      onLongPress: widget.onLongPress != null ? () => widget.onLongPress?.call() : null,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: widget.decoration ??
              BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                borderRadius: borderRadius,
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.child != null) widget.child!,
              if (widget.child != null) const SizedBox(height: 8),
              widget.label,
            ],
          ),
        ),
      ),
    );
  }
}
