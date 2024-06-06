import 'package:flutter/material.dart';

class Route {
  String name;
  Widget Function(BuildContext, Widget)? wrapper;
  Widget Function(BuildContext) builder;
  Route? parent;
  List<Route> children = [];

  String path = '';

  Route({required this.name, this.wrapper, required this.builder, required this.children}) {
    path = '/$name';
    for (final child in children) {
      child.path = '$path/${child.path}';
      child.parent = this;
    }
  }

  List<Route> get routeList {
    final List<Route> list = [];
    for (final child in children) {
      list.addAll(child.routeList);
    }
    list.add(this);
    return list;
  }

  Widget build(BuildContext context) {
    wrapper ??= (context, child) => child;
    return wrapper!(context, builder(context));
  }
}
