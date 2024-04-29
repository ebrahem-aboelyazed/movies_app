import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/modules/movies/movies.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, action) {
        return MovieDetailsPage(id: movie.imdbID);
      },
      closedBuilder: (context, action) {
        return Stack(
          children: [
            MovieDetailCard(movie: movie),
            Positioned(
              right: -5,
              child: FavoriteIcon(movie: movie),
            ),
          ],
        );
      },
    );
  }
}
