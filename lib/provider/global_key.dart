import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:skyjtx_website/main.dart';

class GlobalKeyProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMsgKey = GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<MainAppState> mainAppStateKey = GlobalKey<MainAppState>();

  NavigatorState get navigator => navigatorKey.currentState!;
  ScaffoldMessengerState get scaffoldMsg => scaffoldMsgKey.currentState!;
  MainAppState get mainAppState => mainAppStateKey.currentState!;

  static GlobalKeyProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<GlobalKeyProvider>(context, listen: listen);
  }

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
