import 'dart:collection';

import 'package:flutter/material.dart';

class Route {
  String key = '';
  String name;
  Widget Function(BuildContext, Widget)? wrapper;
  Widget Function(BuildContext) builder;
  Route? parent;
  List<Route> children = [];

  Route({
    required this.key,
    required this.name,
    this.wrapper,
    required this.builder,
    required this.children,
  }) {
    for (final child in children) {
      child.parent = this;
    }
  }

  String get path {
    return parent != null ? '${parent!.path}/$name' : name;
  }

  List<Route> get routeList {
    final HashSet<Route> routeSet = HashSet();
    routeSet.add(this);
    for (final child in children) {
      if (routeSet.contains(child)) {
        throw Exception('Duplicate key: ${child.key}');
      }
      routeSet.addAll(child.routeList);
    }

    return routeSet.toList();
  }

  Map<String, Route> get routeMap {
    final Map<String, Route> map = {};
    for (final route in routeList) {
      if (map.containsKey(route.key)) {
        throw Exception('Duplicate key: ${route.key}');
      }
      map[route.key] = route;
    }
    return map;
  }

  Route? getRouteFromKey(String key) {
    return routeMap[key];
  }

  Widget build(BuildContext context) {
    wrapper ??= (context, child) => child;
    return wrapper!(context, builder(context));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Route && other.key == key;
  }

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() {
    return 'Route(key: $key, name: $name, path: $path, children: $children)';
  }
}
