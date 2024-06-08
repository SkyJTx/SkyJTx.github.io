import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class GlobalKeyProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMsgKey = GlobalKey<ScaffoldMessengerState>();

  NavigatorState get navigator => navigatorKey.currentState!;
  ScaffoldMessengerState get scaffoldMsg => scaffoldMsgKey.currentState!;

  void showSnackBar(
    BuildContext context, {
    required Widget content,
    AnimationStyle? animationStyle,
  }) {
    scaffoldMsg.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        margin: EdgeInsets.only(
          left: 70.w,
          right: 16,
          bottom: 16,
        ),
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Expanded(child: content),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              onPressed: scaffoldMsg.hideCurrentSnackBar,
            ),
          ],
        ),
      ),
      snackBarAnimationStyle: animationStyle ??
          AnimationStyle(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            reverseCurve: Curves.easeInOut,
            reverseDuration: const Duration(milliseconds: 300),
          ),
    );
  }
}
