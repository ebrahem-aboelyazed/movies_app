import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/core.dart';

class AppHelper {
  const AppHelper._();

  static Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnv();
    await configureDependencies();
    await _initHive();
  }

  static Future<void> _initHive() async {
    final hiveManager = getIt.get<HiveManager>();
    await Hive.initFlutter();
    await hiveManager.initializeFavoritesBox();
    await hiveManager.initializeWatchListBox();
    await hiveManager.initializePrefsBox();
    await hiveManager.initializeSettingsBox();
  }

  static Future<void> _loadEnv() async {
    try {
      await dotenv.load();
    } catch (e) {
      logger.e(e);
    }
  }
}
