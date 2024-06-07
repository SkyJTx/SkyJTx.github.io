import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hive/hive.dart';
import 'package:skyjtx_website/class/mutable_enum.dart';

class Setting<T> implements MutableEnum {
  static final _baseHashValue = boxName.hashCode;
  static const boxName = 'Settings';
  static final values = <Setting>[
    Setting<String>(name: 'Primary Color', defaultValue: Colors.purple.toHexString()),
    Setting<bool>(name: 'Dark Mode', defaultValue: ThemeMode.system == ThemeMode.dark),
    Setting<double>(name: 'Font Size', defaultValue: 16.0)
  ];

  static final primaryColor = values[0];
  static final darkMode = values[1];
  static final fontSize = values[2];

  static Box get box => Hive.box(boxName);
  static Future<Box> init() async => await Hive.openBox(boxName);
  static U get<U>(Setting<U> setting) => box.get(setting.name, defaultValue: setting.defaultValue);
  static Future<void> set<U>(Setting<U> setting, U? value) async =>
      await box.put(setting.name, value);
  static Future<void> remove(Setting setting) async => await box.delete(setting.name);
  static Future<void> reset() async => await box.clear();
  static Future<void> close() async => await box.close();

  @override
  String name;
  T defaultValue;

  Setting({required this.name, required this.defaultValue});

  T get value => get(this);
  @override
  int get index => values.indexOf(this);
  set value(T value) => set(this, value);

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) => other is Setting && other.name == name;

  @override
  int get hashCode => Object.hashAll([_baseHashValue, name.hashCode]);
}

class SettingsProvider extends ChangeNotifier {
  Color get primaryColor => Color(int.parse(Setting.primaryColor.value, radix: 16));
  bool get darkMode => Setting.darkMode.value;
  double get fontSize => Setting.fontSize.value;

  ThemeData get theme => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      );

  @override
  void dispose() {
    Setting.close();
    super.dispose();
  }

  static Future<SettingsProvider> init() async {
    await Setting.init();

    final SettingsProvider provider = SettingsProvider();

    return provider;
  }

  dynamic get(Setting setting) {
    return setting.value;
  }

  FutureOr<void> set(Setting setting, dynamic value) async {
    await Setting.set(setting, value);

    notifyListeners();
  }

  FutureOr<void> remove(Setting setting) async {
    await Setting.remove(setting);

    notifyListeners();
  }

  FutureOr<void> reset() async {
    await Setting.reset();

    notifyListeners();
  }
}
