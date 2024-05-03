import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

/// A class for managing movies watchlist.
///
/// This class provides methods to interact with a watchlist storage, allowing
/// users to add, remove, and retrieve movies from the watchlist.
@LazySingleton()
class WatchListStorage {
  /// Retrieves the box containing the watchlist movies.
  Box<String> get watchListBox => Hive.box<String>(AppConstants.watchList);

  /// Returns a [ValueListenable] that notifies listeners when the watchlist
  /// box changes.
  ValueListenable<Box<String>> getWatchlistStream() {
    return watchListBox.listenable();
  }

  /// Retrieves the list of movies in the watchlist.
  ///
  /// Returns a list of [Movie] objects stored in the watchlist box.
  List<Movie> getWatchlist() {
    final watchList = watchListBox.values.toList();
    return watchList.map((e) {
      final json = jsonDecode(e) as Map<String, dynamic>;
      return Movie.fromJson(json);
    }).toList();
  }

  /// Adds a movie to the watchlist.
  ///
  /// [item]: The movie to add to the watchlist.
  Future<void> putToWatchlist(Movie item) async {
    try {
      final json = jsonEncode(item.toJson());
      await watchListBox.put(item.imdbID, json);
      await watchListBox.flush();
    } catch (_) {}
  }

  /// Removes a movie from the watchlist.
  ///
  /// [item]: The movie to remove from the watchlist.
  Future<void> removeFromWatchlist(Movie item) async {
    try {
      if (!watchListBox.containsKey(item.imdbID)) return;
      await watchListBox.delete(item.imdbID);
      await watchListBox.flush();
    } catch (_) {}
  }

  /// Checks if the watchlist contains a movie with the specified ID.
  ///
  /// [id]: The ID of the movie to check for in the watchlist.
  ///
  /// Returns `true` if the watchlist contains the movie, otherwise `false`.
  bool containsItem(String id) {
    return watchListBox.containsKey(id);
  }

  /// Clears all movies from the watchlist.
  ///
  /// Removes all movies from the watchlist box.
  Future<void> clearWatchlist() async {
    if (watchListBox.isNotEmpty) {
      await watchListBox.clear();
      await watchListBox.flush();
    }
  }
}
