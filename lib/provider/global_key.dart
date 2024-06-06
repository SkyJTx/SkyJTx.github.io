import 'package:flutter/material.dart';

class GlobalKeyProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  NavigatorState get navigator => navigatorKey.currentState!;
  ScaffoldMessengerState get scaffold => scaffoldKey.currentState!;
}
