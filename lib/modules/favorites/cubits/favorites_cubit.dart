import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/favorites/favorites.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'favorites_cubit.freezed.dart';
part 'favorites_state.dart';

/// Manages favorite movies using a [FavoritesStorage] instance.
class FavoritesCubit extends Cubit<FavoritesState> {
  /// Constructs a [FavoritesCubit] with the provided [favoritesStorage].
  FavoritesCubit({
    required this.favoritesStorage,
  }) : super(const FavoritesState.initial());

  /// The [FavoritesStorage] instance used to manage favorite movies.
  final FavoritesStorage favoritesStorage;

  /// Returns a [ValueListenable] to listen for changes in the favorites box.
  ValueListenable<Box<String>> getFavoritesStream() {
    return favoritesStorage.getFavoritesStream();
  }

  /// Retrieves a list of favorite movies.
  ///
  /// Returns a list of [Movie] objects representing favorite movies.
  List<Movie> getFavorites() {
    return favoritesStorage.getFavorites();
  }

  /// Removes a movie from the list of favorites.
  ///
  /// [item] is the movie to be removed from favorites.
  Future<void> removeFromFavorites(Movie item) async {
    await favoritesStorage.removeFromFavorites(item);
  }
}
