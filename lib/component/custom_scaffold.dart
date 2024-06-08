import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:skyjtx_website/component/animated_background.dart';
import 'package:skyjtx_website/provider/settings.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;

  const CustomScaffold({required this.body, super.key});

  @override
  State<CustomScaffold> createState() => CustomScaffoldState();
}

class CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Text(
            'SkyJT\'s Website',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        drawer: SizedBox(
          width: min(70.w, 600),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: min(70.w, 600),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.5),
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
                        children: const [
                          ListTile(
                            title: Text('Home'),
                          ),
                          ListTile(
                            title: Text('About'),
                          ),
                          ListTile(
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
          ),
        ),
        body: widget.body,
      ),
    );
  }
}