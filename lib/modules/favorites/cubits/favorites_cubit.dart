import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/favorites/favorites.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'favorites_cubit.freezed.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.favoritesStorage,
  }) : super(const FavoritesState.initial());

  final FavoritesStorage favoritesStorage;

  ValueListenable<Box<String>> getFavoritesStream() {
    return favoritesStorage.getFavoritesStream();
  }

  List<Movie> getFavorites() {
    return favoritesStorage.getFavorites();
  }

  Future<void> removeFromFavorites(Movie item) async {
    await favoritesStorage.removeFromFavorites(item);
  }
}
