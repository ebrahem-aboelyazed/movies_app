import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class SettingsStorage {
  Box<dynamic> get preferencesBox =>
      Hive.box<dynamic>(AppConstants.preferences);

  String get localeName {
    final languageCode =
        preferencesBox.get(AppConstants.languageCode) as String?;
    return languageCode ?? 'en';
  }

  void setLocale({required String languageCode, String? countryCode}) {
    preferencesBox
      ..put(AppConstants.languageCode, languageCode)
      ..put(AppConstants.countryCode, countryCode);
  }

  bool isDarkMode() {
    final languageCode =
        preferencesBox.get(AppConstants.mode) as bool? ?? true;
    return languageCode;
  }

  void setMode({required bool isDark}) {
    preferencesBox.put(AppConstants.mode, isDark);
  }
}
