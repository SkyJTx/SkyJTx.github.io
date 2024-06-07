import 'package:flutter/material.dart';

class GlobalKeyProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMsgKey = GlobalKey<ScaffoldMessengerState>();

  NavigatorState get navigator => navigatorKey.currentState!;
  ScaffoldMessengerState get scaffoldMsg => scaffoldMsgKey.currentState!;
}
