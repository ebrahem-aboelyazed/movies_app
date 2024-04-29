import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class FavoritesStorage {
  Box<String> get favoritesBox => Hive.box<String>(AppConstants.favorites);

  ValueListenable<Box<String>> getFavoritesStream() {
    return favoritesBox.listenable();
  }

  List<Movie> getFavorites() {
    final favorites = favoritesBox.values.toList();
    return favorites.map((e) {
      final json = jsonDecode(e) as Map<String, dynamic>;
      return Movie.fromJson(json);
    }).toList();
  }

  Future<void> putToFavorites(Movie item) async {
    try {
      final json = jsonEncode(item.toJson());
      await favoritesBox.put(item.imdbID, json);
      await favoritesBox.flush();
    } catch (_) {}
  }

  Future<void> removeFromFavorites(Movie item) async {
    try {
      if (!favoritesBox.containsKey(item.imdbID)) return;
      await favoritesBox.delete(item.imdbID);
      await favoritesBox.flush();
    } catch (_) {}
  }

  bool containsItem(String id) {
    return favoritesBox.containsKey(id);
  }

  Future<void> clearFavorites() async {
    if (favoritesBox.isNotEmpty) {
      await favoritesBox.clear();
      await favoritesBox.flush();
    }
  }
}
