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

  bool endOfList = false;

  String name = '';
  int page = 1;

  Future<void> searchMovies() async {
    page = 1;
    moviesList.clear();
    endOfList = false;
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
        if (movies.isNotEmpty) {
          moviesList.addAll(movies);
        } else {
          endOfList = true;
        }
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
}
