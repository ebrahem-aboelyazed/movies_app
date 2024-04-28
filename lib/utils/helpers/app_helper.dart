import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/core/core.dart';

class AppHelper {
  const AppHelper._();

  static Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnv();
    await configureDependencies();
  }

  static Future<void> _loadEnv() async {
    try {
      await dotenv.load();
    } catch (e) {
      logger.e(e);
    }
  }
}
