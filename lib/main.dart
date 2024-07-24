import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skyjtx_website/constant/route.dart';
import 'package:skyjtx_website/presentation/error_page/404.dart';
import 'package:skyjtx_website/provider/global_key.dart';
import 'package:skyjtx_website/provider/settings.dart';
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
  @override
  Widget build(BuildContext context) {
    final settingsProvider = SettingsProvider.of(context);
    final globalKeyProvider = GlobalKeyProvider.of(context);
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'SkyJT\'x Website',
          scaffoldMessengerKey: globalKeyProvider.scaffoldMsgKey,
          navigatorKey: globalKeyProvider.navigatorKey,
          initialRoute: routes.path,
          onGenerateRoute: (settings) {
            debugPrint('Route: ${settings.name}');
            debugPrint('Route: ${routes.routeList}');
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                final routePath = settings.name;
                final route = routes.routeList.where((element) => element.path == routePath);
                if (route.isEmpty) {
                  return NotFoundPage(settings: settings);
                }
                return route.first.build(context);
              },
              settings: settings,
            );
          },
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
