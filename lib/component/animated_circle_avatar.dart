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
  late Animation<double> scaleAnimation;
  late Animation<double> fadeInAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCubicEmphasized,
    );
    final sizeTweens = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 2, end: 0.7),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.7, end: 1),
        weight: 50,
      ),
    ]);
    final fadeInTween = Tween<double>(
      begin: 0,
      end: 1,
    );
    scaleAnimation = sizeTweens.animate(curve);
    fadeInAnimation = fadeInTween.animate(curve);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: FadeTransition(
        opacity: fadeInAnimation,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
          ),
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
        ),
      ),
    );
  }
}
