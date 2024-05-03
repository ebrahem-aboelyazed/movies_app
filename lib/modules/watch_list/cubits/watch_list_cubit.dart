import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/modules/watch_list/watch_list.dart';

part 'watch_list_cubit.freezed.dart';
part 'watch_list_state.dart';

/// A Cubit for managing the movies watchlist state.
///
/// This Cubit provides methods to interact with the watchlist, such as
/// retrieving the watchlist stream, getting the current watchlist,
/// and removing movies from the watchlist.
class WatchListCubit extends Cubit<WatchListState> {
  /// Initializes the WatchListCubit with the specified [watchListStorage].
  ///
  /// [watchListStorage]: The storage instance used to manage the watchlist.
  WatchListCubit({
    required this.watchListStorage,
  }) : super(const WatchListState.initial());

  final WatchListStorage watchListStorage;

  /// Retrieves a [ValueListenable] that notifies listeners when the watchlist
  /// changes.
  ///
  /// Returns a [ValueListenable] containing the watchlist stream.
  ValueListenable<Box<String>> getWatchListStream() {
    return watchListStorage.getWatchlistStream();
  }

  /// Retrieves the current watchlist.
  ///
  /// Returns a list of [Movie] objects representing the current watchlist.
  List<Movie> getWatchList() {
    return watchListStorage.getWatchlist();
  }

  /// Removes the specified [movies] from the watchlist.
  ///
  /// [movies] : The movie to remove from the watchlist.
  Future<void> removeFromWatchList(Movie movies) async {
    await watchListStorage.removeFromWatchlist(movies);
  }
}
