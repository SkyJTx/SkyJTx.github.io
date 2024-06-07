import 'package:get_it/get_it.dart';
import 'package:skyjtx_website/provider/global_key.dart';
import 'package:skyjtx_website/provider/settings.dart';

Future<void> init() async {
  final getIt = GetIt.instance;

  final settingsProvider = await SettingsProvider.init();

  getIt.registerFactory(() => settingsProvider);
  getIt.registerLazySingleton(() => GlobalKeyProvider());
}
