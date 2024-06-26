import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MovieDetailCard extends StatelessWidget {
  const MovieDetailCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
