import 'package:flutter/material.dart';
import 'package:skyjtx_website/class/router.dart' as router;
import 'package:skyjtx_website/presentation/homepage/home.dart';

final routes = router.Route(
  key: HomePage.routeKey,
  name: '',
  wrapper: (context, child) {
    return SelectionArea(child: child);
  },
  builder: (context, key) => const HomePage(),
  children: [],
);
