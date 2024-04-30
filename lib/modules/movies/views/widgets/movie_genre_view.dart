import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/models/movie.dart';
import 'package:movies_app/utils/utils.dart';

class MovieGenreView extends StatelessWidget {
  const MovieGenreView({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: movie.genre.split(',').map((e) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: const BoxDecoration(
            color: AppColors.lightPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            e,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
