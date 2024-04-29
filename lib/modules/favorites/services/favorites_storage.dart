import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

@LazySingleton()
class FavoritesStorage {
  Box<Map<String, dynamic>> get favoritesBox =>
      Hive.box<Map<String, dynamic>>(AppConstants.favorites);

  List<Movie> getFavorites() {
    final favorites = favoritesBox.values.toList();
    return favorites.map(Movie.fromJson).toList();
  }

  Future<void> putToFavorites(Movie item) async {
    try {
      await favoritesBox.put(item.imdbID, item.toJson());
      await favoritesBox.flush();
    } catch (_) {}
  }

  Future<void> removeFromFavorites(Movie item) async {
    try {
      await favoritesBox.delete(item.imdbID);
      await favoritesBox.flush();
    } catch (_) {}
  }

  Future<void> clearFavorites() async {
    if (favoritesBox.isNotEmpty) {
      await favoritesBox.clear();
      await favoritesBox.flush();
    }
  }
}
