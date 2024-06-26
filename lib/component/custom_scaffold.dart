import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:skyjtx_website/component/animated_background.dart';
import 'package:skyjtx_website/presentation/homepage/home.dart';
import 'package:skyjtx_website/provider/global_key.dart';
import 'package:skyjtx_website/provider/settings.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;

  const CustomScaffold({required this.body, super.key});

  @override
  State<CustomScaffold> createState() => CustomScaffoldState();
}

class CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScaffoldState? get key => _scaffoldKey.currentState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingProvider = Provider.of<SettingsProvider>(context);

    return AnimatedBackground(
      curve: Curves.linear,
      duration: const Duration(seconds: 10),
      colors: theme.brightness == Brightness.light
          ? [
              Colors.blue[300]!,
              Colors.purple[300]!,
              Colors.orange[300]!,
            ]
          : [
              Colors.blue,
              Colors.purple,
              Colors.pink,
            ],
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Text(
            'SkyJT\'s Website',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        drawer: Container(
          width: min(50.w, 400),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Flexible(
                  child: ListView(
                    children: [
                      ListTile(
                        selected: ModalRoute.of(context)?.settings.name ==
                            GlobalKeyProvider.of(
                              context,
                            ).mainAppState.routes.routeMap[HomePage.routeKey]?.path,
                        leading: const Icon(Icons.home),
                        title: const Text('Home'),
                        onTap: () {
                          final globalKeyProvider = GlobalKeyProvider.of(
                            context,
                            listen: false,
                          );
                          final routes = globalKeyProvider.mainAppState.routes;
                          final homePageRoute = routes.routeMap[HomePage.routeKey];
                          if (homePageRoute == null) return;
                          if (homePageRoute.path == ModalRoute.of(context)!.settings.name) {
                            return;
                          }
                          globalKeyProvider.navigator.pushNamed(
                            homePageRoute.path,
                          );
                        },
                      ),
                      const ListTile(
                        title: Text('About'),
                      ),
                      const ListTile(
                        title: Text('Contact'),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.dark_mode),
                    const SizedBox(width: 12),
                    const Text('Dark Mode'),
                    const Spacer(),
                    Switch(
                      value: settingProvider.darkMode,
                      onChanged: (value) {
                        settingProvider.set(Setting.darkMode, value);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: widget.body,
      ),
    );
  }
}
