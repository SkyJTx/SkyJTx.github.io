import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;

  const CustomScaffold({required this.body, super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('SkyJTx\'s Website'),
      ),
      drawer: Container(
        constraints: BoxConstraints(
          maxWidth: min(600, 70.w),
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
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
      body: widget.body,
    );
  }
}
