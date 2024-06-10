import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skyjtx_website/presentation/homepage/home.dart';
import 'package:skyjtx_website/provider/global_key.dart';
import 'package:skyjtx_website/provider/settings.dart';
import 'package:skyjtx_website/class/router.dart' as router;
import 'package:skyjtx_website/dependencies_injector.dart' as dependencies_injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies_injector.init();
  final GetIt getIt = GetIt.instance;
  runApp(
    Provider(
      create: (_) => GlobalKeyProvider(),
      child: ChangeNotifierProvider(
        create: (_) => getIt.get<SettingsProvider>(),
        child: Builder(
          builder: (context) {
            return MainApp(
              key: GlobalKeyProvider.of(context).mainAppStateKey,
            );
          },
        ),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final focusNode = FocusNode();
  final textSelectionController = MaterialTextSelectionControls();

  late router.Route routes;

  Widget selectionWrapper(BuildContext context, Widget child) {
    return SelectionArea(
      focusNode: focusNode,
      selectionControls: textSelectionController,
      child: child,
    );
  }

  @override
  void initState() {
    routes = router.Route(
      key: HomePage.routeKey,
      name: '',
      wrapper: selectionWrapper,
      builder: (context) => const HomePage(),
      children: [],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = SettingsProvider.of(context);
    final globalKeyProvider = GlobalKeyProvider.of(context);
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'SkyJT\'x Website',
          navigatorKey: globalKeyProvider.navigatorKey,
          scaffoldMessengerKey: globalKeyProvider.scaffoldMsgKey,
          initialRoute: routes.path,
          routes: {
            for (final route in routes.routeList) route.path: route.build,
          },
          theme: settingsProvider.theme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
