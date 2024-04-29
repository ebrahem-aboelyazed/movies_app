import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/l10n/l10n.dart';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${context.l10n.summary}:',
                              style: Styles.boldText,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FavoriteIcon(movie: movie),
                              WatchListIcon(movie: movie),
                            ],
                          ),
                        ],
                      ),
                      Text(movie.plot),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            '${context.l10n.runtime}:',
                            style: const TextStyle(
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
                          Text(
                            '${context.l10n.director}:',
                            style: Styles.boldText,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movie.director,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${context.l10n.genre}:',
                        style: Styles.boldText,
                      ),
                      Text(movie.genre),
                      // Join genre list into a string
                      const SizedBox(height: 8),
                      Text(
                        '${context.l10n.actors}:',
                        style: Styles.boldText,
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
