import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class ApiCacheManager {
  /// Retrieves the cache box used for storing cached data.
  Box<String> get cacheBox => Hive.box<String>(AppConstants.cacheBox);

  /// Retrieves cached data by key and decodes it.
  ///
  /// Parameters:
  ///   - [key] (String): The key associated with the cached data.
  ///
  /// Returns:
  ///   The decoded cached data if found, otherwise null.
  dynamic getCachedDataByKey(String key) {
    final data = cacheBox.get(key);
    if (data == null) return null;
    final decodedData = jsonDecode(data);
    return decodedData;
  }

  /// Stores data in the cache box with the specified key.
  ///
  /// Parameters:
  ///   - [key] (String): The key associated with the data to be cached.
  ///   - [data] (dynamic): The data to be cached.
  ///
  /// Returns:
  ///   A Future that completes when the data is successfully cached.
  Future<void> putDataInCache(String key, dynamic data) async {
    final encodedData = jsonEncode(data);
    await cacheBox.put(key, encodedData);
  }
}
