import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/widgets/cached_image.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, action) {
        return MovieDetailsPage(id: movie.imdbID);
      },
      closedBuilder: (context, action) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display movie poster
              CachedImage(
                movie.poster,
                height: 200,
                radius: 8,
              ),
              const SizedBox(height: 8),
              // Display movie title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  movie.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              // Display release year and rating (if available)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      movie.year,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    if (movie.imdbRating.isNotEmpty)
                      Text(
                        movie.imdbRating,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.amber,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        );
      },
    );
  }
}
