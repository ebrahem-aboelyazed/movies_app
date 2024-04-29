import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/modules/watch_list/watch_list.dart';

class WatchListIcon extends StatelessWidget {
  const WatchListIcon({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final watchListStorage = getIt.get<WatchListStorage>();
    return ValueListenableBuilder<Box<String>>(
      valueListenable: watchListStorage.getWatchlistStream(),
      builder: (context, value, child) {
        final containsItem = watchListStorage.containsItem(movie.imdbID);
        return IconButton(
          onPressed: () async {
            if (containsItem) {
              await watchListStorage.removeFromWatchlist(movie);
            } else {
              await watchListStorage.putToWatchlist(movie);
            }
          },
          iconSize: 30,
          color: containsItem ? Colors.blueGrey : null,
          icon: containsItem
              ? const Icon(Icons.bookmark_add)
              : const Icon(Icons.bookmark_add_outlined),
        );
      },
    );
  }
}
