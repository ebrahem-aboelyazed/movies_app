import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/widgets/cached_image.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/utils/utils.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late final Future<Movie?> _future;

  @override
  void initState() {
    super.initState();
    _future = context.read<MoviesCubit>().getMovieById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<Movie?>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              final movie = snapshot.data!;
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: context.heightPercentage(0.6),
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CachedImage(
                          movie.poster,
                          radius: 0,
                          height: context.heightPercentage(0.6),
                        ),
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display movie details (same as before)
                      const Text(
                        'Plot Summary:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(movie.plot),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text(
                            'Runtime:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movie.runtime,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Director:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movie.director,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Genre:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(movie.genre),
                      // Join genre list into a string
                      const SizedBox(height: 8),
                      const Text(
                        'Actors:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(movie.actors),
                      // Join actors list into a string
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error_outline));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}