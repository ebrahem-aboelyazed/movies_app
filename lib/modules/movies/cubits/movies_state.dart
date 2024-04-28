part of 'movies_cubit.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = MoviesInitial;

  const factory MoviesState.loading() = MoviesLoading;

  const factory MoviesState.loadingMore() = MoviesLoadingMore;

  const factory MoviesState.loaded(List<Movie> clients) = MoviesLoaded;

  const factory MoviesState.searching(String? search) = MoviesSearching;

  const factory MoviesState.failure(Failure failure) = MoviesFailure;
}
