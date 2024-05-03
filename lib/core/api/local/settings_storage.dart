import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/utils/utils.dart';

/// Manages settings storage using Hive boxes.
@LazySingleton()
class SettingsStorage {
  /// The preferences box for storing application preferences.
  Box<dynamic> get preferencesBox =>
      Hive.box<dynamic>(AppConstants.preferences);

  /// Retrieves the locale name from the preferences box.
  ///
  /// If the locale name is not found, returns 'en' as the default locale.
  String get localeName {
    final languageCode =
    preferencesBox.get(AppConstants.languageCode) as String?;
    return languageCode ?? 'en';
  }

  /// Sets the locale in the preferences box.
  ///
  /// [languageCode] is the language code to be set.
  /// [countryCode] is the optional country code to be set.
  void setLocale({required String languageCode, String? countryCode}) {
    preferencesBox
      ..put(AppConstants.languageCode, languageCode)
      ..put(AppConstants.countryCode, countryCode);
  }

  /// Checks if the dark mode is enabled.
  ///
  /// If dark mode is not found, returns `true` as the default value.
  bool isDarkMode() {
    final mode = preferencesBox.get(AppConstants.mode) as bool? ?? true;
    return mode;
  }

  /// Sets the dark mode preference in the preferences box.
  ///
  /// [isDark] specifies whether dark mode is enabled.
  void setMode({required bool isDark}) {
    preferencesBox.put(AppConstants.mode, isDark);
  }
}
