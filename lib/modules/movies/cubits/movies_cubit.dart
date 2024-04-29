import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'movies_cubit.freezed.dart';
part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this.moviesService,
  }) : super(const MoviesState.initial());

  final MoviesService moviesService;

  final List<Movie> moviesList = <Movie>[];

  Timer? _debounce;

  bool endOfList = false;

  String name = '';
  int page = 1;

  void searchMovies({String? query}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      executeSearch(query: query);
    });
  }

  Future<void> executeSearch({String? query}) async {
    if (query != null) name = query;
    page = 1;
    endOfList = false;
    moviesList.clear();
    if (name.isEmpty) {
      emit(const MoviesState.initial());
      return;
    }
    emit(const MoviesState.loading());
    final response = await moviesService.searchMovies(
      name: name,
      page: page,
    );
    response.fold(
      (failure) => emit(MoviesState.failure(failure)),
      (movies) {
        moviesList.addAll(movies);
        emit(MoviesState.loaded(movies));
      },
    );
  }

  Future<void> paginateMovies() async {
    emit(const MoviesState.loadingMore());
    page++;
    final response = await moviesService.searchMovies(
      name: name,
      page: page,
    );
    response.fold(
      (failure) => emit(MoviesState.loaded(moviesList)),
      (movies) {
        movies.isEmpty ? endOfList = true : moviesList.addAll(movies);
        emit(MoviesState.loaded(moviesList));
      },
    );
  }

  Future<Movie?> getMovieById({required String id}) async {
    final response = await moviesService.getMovieById(id: id);
    return response.fold(
      (failure) {
        throw Exception();
      },
      (movie) => movie,
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
