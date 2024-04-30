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
      body: SafeArea(
        child: FutureBuilder<Movie?>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              final movie = snapshot.data!;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    expandedHeight: context.heightPercentage(0.4),
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedImage(
                        movie.poster,
                        radius: 0,
                        height: context.heightPercentage(0.6),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailsCard(movie: movie),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                  ),
                  ErrorView(
                    message: context.l10n.something_went_wrong,
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
