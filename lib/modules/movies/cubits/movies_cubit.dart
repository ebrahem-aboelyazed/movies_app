import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'movies_cubit.freezed.dart';
part 'movies_state.dart';

/// Cubit for managing movie-related states and operations.
class MoviesCubit extends Cubit<MoviesState> {
  /// Constructs a [MoviesCubit] with the provided [moviesService].
  MoviesCubit({
    required this.moviesService,
  }) : super(const MoviesState.initial());

  /// The [MoviesService] instance used to interact with movie-related data.
  final MoviesService moviesService;

  /// List of movies currently loaded in the cubit.
  final List<Movie> moviesList = <Movie>[];

  Timer? _debounce;

  /// Indicates whether the end of the movie list has been reached.
  bool endOfList = false;

  /// The current search query.
  String name = '';

  /// The current page number for pagination.
  int page = 1;

  /// Initiates a movie search operation with optional debounce.
  ///
  /// If a search is already in progress,
  /// the existing debounce timer is canceled
  /// and a new one is started.
  ///
  /// [query] is a parameter representing the search query.
  void searchMovies({String? query}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      executeSearch(query: query);
    });
  }

  /// Executes the movie search operation.
  ///
  /// [query] is an optional parameter representing the search query.
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

  /// Paginates through the movie list to load more movies.
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

  /// Retrieves detailed information about a movie with the specified [id].
  ///
  /// Returns a [Future] containing a [Movie] object if successful,
  /// otherwise throws an exception.
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
