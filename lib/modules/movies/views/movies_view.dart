import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final moviesCubit = context.read<MoviesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: SearchField(
          onChanged: (value) {
            moviesCubit.searchMovies(query: value);
          },
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          buildWhen: (previous, current) {
            return current is MoviesLoading ||
                current is MoviesLoaded ||
                current is MoviesFailure ||
                current is MoviesInitial;
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: MoviesInitialView.new,
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              failure: (failure) {
                return ErrorView(message: failure.message);
              },
              orElse: () {
                final movies = (state as MoviesLoaded).movies;
                if (movies.isEmpty) {
                  return const Center(child: EmptyView());
                }
                return MoviesGridView(movies: movies);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
