import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

/// Manages storage of favorite items using a Hive box.
@LazySingleton()
class FavoritesStorage {
  /// The favorites box for storing favorite items.
  Box<String> get favoritesBox => Hive.box<String>(AppConstants.favorites);

  /// Returns a [ValueListenable] to listen for changes in the favorites box.
  ValueListenable<Box<String>> getFavoritesStream() {
    return favoritesBox.listenable();
  }

  /// Retrieves a list of favorite movies from the favorites box.
  ///
  /// Returns a list of [Movie] objects representing favorite movies.
  List<Movie> getFavorites() {
    final favorites = favoritesBox.values.toList();
    return favorites.map((e) {
      final json = jsonDecode(e) as Map<String, dynamic>;
      return Movie.fromJson(json);
    }).toList();
  }

  /// Adds a movie to the favorites box.
  ///
  /// [item] is the movie to be added to favorites.
  Future<void> putToFavorites(Movie item) async {
    try {
      final json = jsonEncode(item.toJson());
      await favoritesBox.put(item.imdbID, json);
      await favoritesBox.flush();
    } catch (_) {}
  }

  /// Removes a movie from the favorites box.
  ///
  /// [item] is the movie to be removed from favorites.
  Future<void> removeFromFavorites(Movie item) async {
    try {
      if (!favoritesBox.containsKey(item.imdbID)) return;
      await favoritesBox.delete(item.imdbID);
      await favoritesBox.flush();
    } catch (_) {}
  }

  /// Checks if an item with the given [id] exists in the favorites box.
  ///
  /// Returns `true` if the item exists, otherwise `false`.
  bool containsItem(String id) {
    return favoritesBox.containsKey(id);
  }

  /// Clears all items from the favorites box.
  Future<void> clearFavorites() async {
    if (favoritesBox.isNotEmpty) {
      await favoritesBox.clear();
      await favoritesBox.flush();
    }
  }
}
