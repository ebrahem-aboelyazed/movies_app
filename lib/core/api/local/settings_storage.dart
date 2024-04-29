import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class SettingsStorage {
  Box<dynamic> get preferencesBox =>
      Hive.box<dynamic>(AppConstants.preferences);

  Box<dynamic> get settingsBox => Hive.box<dynamic>(AppConstants.settings);

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
}
