import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class WatchListStorage {
  Box<Movie> get watchListBox => Hive.box<Movie>(AppConstants.watchList);

  Future<void> putToFavorites(Movie item) async {
    try {
      await watchListBox.put(item.imdbID, item);
      await watchListBox.flush();
    } catch (_) {}
  }

  Future<void> removeFromFavorites(Movie item) async {
    try {
      await watchListBox.delete(item.imdbID);
      await watchListBox.flush();
    } catch (_) {}
  }

  Future<void> clearFavorites() async {
    if (watchListBox.isNotEmpty) {
      await watchListBox.clear();
      await watchListBox.flush();
    }
  }
}
