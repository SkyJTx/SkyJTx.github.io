import 'package:flutter/material.dart';
import 'package:skyjtx_website/component/custom_scaffold.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  static const String routeKey = 'works';

  @override
  State<WorksPage> createState() => WorksPageState();
}

class WorksPageState extends State<WorksPage> {
  final GlobalKey<CustomScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Text('Works Page ${ModalRoute.of(context)?.settings.name ?? '404'}'),
      ),
    );
  }
}
