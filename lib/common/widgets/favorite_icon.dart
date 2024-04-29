import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/favorites/favorites.dart';
import 'package:movies_app/modules/movies/movies.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final favoritesStorage = getIt.get<FavoritesStorage>();
    return ValueListenableBuilder<Box<String>>(
      valueListenable: favoritesStorage.getFavoritesStream(),
      builder: (context, value, child) {
        final containsItem = favoritesStorage.containsItem(movie.imdbID);
        return IconButton(
          onPressed: () async {
            if (containsItem) {
              await favoritesStorage.removeFromFavorites(movie);
            } else {
              await favoritesStorage.putToFavorites(movie);
            }
          },
          iconSize: 30,
          color: containsItem ? Colors.red : null,
          icon: containsItem
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline),
        );
      },
    );
  }
}
