import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/utils/utils.dart';

/// Manages Hive boxes for storing data securely.
@Singleton()
class HiveManager {
  /// Sets up a secure encryption key for encrypting sensitive data.
  ///
  /// Returns:
  ///   A Future that resolves to a Uint8List containing the encryption key.
  Future<Uint8List> _setupSecureKey() async {
    const secureStorage = FlutterSecureStorage();
    final containsEncryptionKey = await secureStorage.containsKey(
      key: AppConstants.secureBoxKey,
    );
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: AppConstants.secureBoxKey,
        value: base64UrlEncode(key),
      );
    }
    final value = await secureStorage.read(key: AppConstants.secureBoxKey);
    return base64Url.decode(value!);
  }

  /// Initializes the preferences box for storing app preferences.
  ///
  /// Returns:
  ///   A Future that resolves to a
  ///   Box<dynamic> representing the preferences box.
  Future<Box<dynamic>> initializePrefsBox() async {
    return Hive.openBox<dynamic>(AppConstants.preferences);
  }

  /// Initializes the settings box for storing app settings.
  ///
  /// Returns:
  ///   A Future that resolves to a Box<dynamic> representing the settings box.
  Future<Box<dynamic>> initializeSettingsBox() async {
    return Hive.openBox<dynamic>(AppConstants.settings);
  }

  /// Initializes the favorites box for storing user's favorite movies.
  ///
  /// Returns:
  ///   A [Box<String>] for storing favorite items with encryption.
  Future<Box<String>> initializeFavoritesBox() async {
    final encryptionKey = await _setupSecureKey();
    return Hive.openBox<String>(
      AppConstants.favorites,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  /// Initializes the watchlist box for storing user's watchlist movies.
  ///
  /// Returns:
  ///   A [Box<String>] for storing watchlist items with encryption.
  Future<Box<String>> initializeWatchListBox() async {
    final encryptionKey = await _setupSecureKey();
    return Hive.openBox<String>(
      AppConstants.watchList,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  /// Initializes the cache box for storing cached data.
  ///
  /// Returns:
  ///   A [Box<String>] for storing cached data with encryption.
  Future<Box<String>> initializeCacheBox() async {
    final encryptionKey = await _setupSecureKey();
    return Hive.openBox<String>(
      AppConstants.cacheBox2,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }
}
