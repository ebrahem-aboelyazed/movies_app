import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/modules/watch_list/watch_list.dart';

part 'watch_list_cubit.freezed.dart';
part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit({
    required this.watchListStorage,
  }) : super(const WatchListState.initial());

  final WatchListStorage watchListStorage;

  ValueListenable<Box<String>> getWatchListStream() {
    return watchListStorage.getWatchlistStream();
  }

  List<Movie> getWatchList() {
    return watchListStorage.getWatchlist();
  }

  Future<void> removeFromWatchList(Movie item) async {
    await watchListStorage.removeFromWatchlist(item);
  }
}
