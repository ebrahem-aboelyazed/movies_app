import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    print('Actors ===>${movie.actors}');
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  movie.title,
                  style: Styles.boldText.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 12),
                  FavoriteIcon(movie: movie),
                  WatchListIcon(movie: movie),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
              ),
              const SizedBox(width: 4),
              Text('${movie.imdbRating}/10'),
              const SizedBox(width: 4),
              const Text('IMDb'),
            ],
          ),
          const SizedBox(height: 16),
          MovieGenreView(movie: movie),
          const SizedBox(height: 16),
          MovieInfoView(movie: movie),
          const SizedBox(height: 16),
          Text(
            context.l10n.summary,
            style: Styles.boldText.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.plot,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.cast,
            style: Styles.boldText.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            children: movie.actors.split(', ').map((name) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chip(
                    label: Text(
                      name,
                      style: const TextStyle(fontSize: 14),
                    ),
                    backgroundColor: AppColors.pastelBlue,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.ratings,
            style: Styles.boldText.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: movie.ratings.map((rating) {
              return Chip(
                label: Text(
                  '${rating.source} : ${rating.value}',
                  style: const TextStyle(fontSize: 14),
                ),
                backgroundColor: const Color(0xff89CFF3),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
