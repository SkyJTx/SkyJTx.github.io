import 'package:flutter/material.dart';
import 'package:skyjtx_website/class/router.dart' as router;
import 'package:skyjtx_website/presentation/homepage/home.dart';
import 'package:skyjtx_website/presentation/workspage/index.dart';

final routes = router.Route(
  key: HomePage.routeKey,
  name: '',
  wrapper: (context, child) {
    return SelectionArea(child: child);
  },
  builder: (context, key) => const HomePage(),
  children: [
    router.Route(
      key: WorksPage.routeKey,
      name: 'works',
      builder: (context, key) => const WorksPage(),
      children: [],
    ),
  ],
);
