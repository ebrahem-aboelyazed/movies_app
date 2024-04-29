import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MoviesGridView extends StatefulWidget {
  const MoviesGridView({required this.movies, super.key});

  final List<Movie> movies;

  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  late final MoviesCubit cubit;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<MoviesCubit>();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RefreshIndicator(
          onRefresh: () async => cubit.executeSearch(),
          child: AlignedGridView.count(
            itemCount: widget.movies.length,
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return MovieCard(movie: movie);
            },
          ),
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoadingMore) {
              return const Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  void _scrollListener() {
    final reachedEndOfScreen = _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
    if (reachedEndOfScreen) {
      if (cubit.state is MoviesLoadingMore || cubit.endOfList) return;
      cubit.paginateMovies();
    }
  }
}
