part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = FavoritesInitial;

  const factory FavoritesState.loading() = FavoritesLoading;

  const factory FavoritesState.loaded(List<Movie> favorites) = FavoritesLoaded;

  const factory FavoritesState.failure(Failure failure) = FavoritesFailure;
}
