import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:skyjtx_website/presentation/error_page/error.dart';
import 'package:skyjtx_website/provider/global_key.dart';
import 'package:skyjtx_website/provider/settings.dart';

Future<void> init() async {
  final getIt = GetIt.instance;

  final settingsProvider = await SettingsProvider.init();

  getIt.registerFactory(() => settingsProvider);
  getIt.registerLazySingleton(() => GlobalKeyProvider());

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      theme: settingsProvider.theme,
      home: ErrorPage(details: details),
    );
  };

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      SystemNavigator.pop();
    }
  };
}
