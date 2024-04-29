import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class WatchListStorage {
  Box<String> get watchListBox => Hive.box<String>(AppConstants.watchList);

  ValueListenable<Box<String>> getWatchlistStream() {
    return watchListBox.listenable();
  }

  List<Movie> getWatchlist() {
    final watchList = watchListBox.values.toList();
    return watchList.map((e) {
      final json = jsonDecode(e) as Map<String, dynamic>;
      return Movie.fromJson(json);
    }).toList();
  }

  Future<void> putToWatchlist(Movie item) async {
    try {
      final json = jsonEncode(item.toJson());
      await watchListBox.put(item.imdbID, json);
      await watchListBox.flush();
    } catch (_) {}
  }

  Future<void> removeFromWatchlist(Movie item) async {
    try {
      if (!watchListBox.containsKey(item.imdbID)) return;
      await watchListBox.delete(item.imdbID);
      await watchListBox.flush();
    } catch (_) {}
  }

  bool containsItem(String id) {
    return watchListBox.containsKey(id);
  }

  Future<void> clearWatchlist() async {
    if (watchListBox.isNotEmpty) {
      await watchListBox.clear();
      await watchListBox.flush();
    }
  }
}
