import 'package:flutter/material.dart';

class AnimatedCircleAvatar extends StatefulWidget {
  final Widget? child;
  final Color? backgroundColor;
  final ImageProvider<Object>? backgroundImage;
  final ImageProvider<Object>? foregroundImage;
  final void Function(Object, StackTrace?)? onBackgroundImageError;
  final void Function(Object, StackTrace?)? onForegroundImageError;
  final Color? foregroundColor;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;

  const AnimatedCircleAvatar({
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
  });

  @override
  State<AnimatedCircleAvatar> createState() => AnimatedCircleAvatarState();
}

class AnimatedCircleAvatarState extends State<AnimatedCircleAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation animation;
  late Tween<double> tween;

  @override
  void didChangeDependencies() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCubicEmphasized,
    );
    tween = Tween<double>(begin: 5, end: 1);
    controller.forward();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedCircleAvatar oldWidget) {
    if (oldWidget.child != widget.child) {
      controller.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: tween.animate(animation),
      child: CircleAvatar(
        backgroundColor: widget.backgroundColor,
        backgroundImage: widget.backgroundImage,
        foregroundImage: widget.foregroundImage,
        onBackgroundImageError: widget.onBackgroundImageError,
        onForegroundImageError: widget.onForegroundImageError,
        foregroundColor: widget.foregroundColor,
        radius: widget.radius,
        minRadius: widget.minRadius,
        maxRadius: widget.maxRadius,
        child: widget.child,
      ),
    );
  }
}
