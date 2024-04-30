import 'package:flutter/material.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MovieInfoView extends StatelessWidget {
  const MovieInfoView({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              context.l10n.runtime,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              movie.runtime,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              context.l10n.year,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              movie.year,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              context.l10n.rating,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              movie.rated,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
