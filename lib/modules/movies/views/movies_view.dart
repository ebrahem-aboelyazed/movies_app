import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesCubit = context.read<MoviesCubit>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              SearchField(
                onChanged: (value) {
                  moviesCubit
                    ..name = value
                    ..searchMovies();
                },
              ),
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<MoviesCubit, MoviesState>(
                  buildWhen: (previous, current) {
                    return current is MoviesLoading ||
                        current is MoviesLoaded ||
                        current is MoviesFailure;
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      initial: () {
                        return Container();
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      failure: (failure) {
                        return Container();
                      },
                      orElse: () {
                        final movies = (state as MoviesLoaded).movies;
                        return MoviesGridView(movies: movies);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
