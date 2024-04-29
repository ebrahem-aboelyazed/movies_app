import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movies_app/modules/favorites/favorites.dart';
import 'package:movies_app/modules/movies/movies.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({required this.movies, super.key});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: movies.length,
      physics: const AlwaysScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 12,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return FavoriteCard(movie: movie);
      },
    );
  }
}
