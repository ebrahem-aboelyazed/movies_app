import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MockMoviesService extends Mock implements MoviesService {}

void main() {
  late MoviesCubit moviesCubit;
  late MoviesService moviesService;

  setUp(() {
    moviesService = MockMoviesService();
    moviesCubit = MoviesCubit(moviesService: moviesService);
  });

  tearDown(() {
    moviesCubit.close();
  });

  group('MoviesCubit', () {
    blocTest<MoviesCubit, MoviesState>(
      'searchMovies emits [loading, loaded] when searchMovies succeeds',
      setUp: () {
        when(() {
          return moviesService.searchMovies(
            name: any(named: 'name'),
            page: any(named: 'page'),
          );
        }).thenAnswer((_) async => const Right([]));
      },
      build: () => moviesCubit,
      act: (cubit) => cubit.executeSearch(query: 'movie'),
      expect: () => [const MoviesState.loading(), const MoviesState.loaded([])],
    );

    blocTest<MoviesCubit, MoviesState>(
      'searchMovies emits [loading, failure] when searchMovies fails',
      setUp: () {
        when(() {
          return moviesService.searchMovies(
            name: any(named: 'name'),
            page: any(named: 'page'),
          );
        }).thenAnswer((_) async => const Left(Failure()));
      },
      build: () => moviesCubit,
      act: (cubit) => cubit.executeSearch(query: 'movie'),
      expect: () => [const MoviesState.loading(), isA<MoviesFailure>()],
    );

    blocTest<MoviesCubit, MoviesState>(
      'paginateMovies emits [loadingMore, loaded] when paginateMovies succeeds',
      setUp: () {
        when(() {
          return moviesService.searchMovies(
            name: any(named: 'name'),
            page: any(named: 'page'),
          );
        }).thenAnswer((_) async => const Right([]));
      },
      build: () => moviesCubit,
      act: (cubit) => cubit.paginateMovies(),
      expect: () => [
        const MoviesState.loadingMore(),
        const MoviesState.loaded([]),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'paginateMovies emits [loadingMore, loaded] '
      'when paginateMovies succeeds with empty movies list',
      build: () {
        when(
          () => moviesService.searchMovies(
            name: any(named: 'name'),
            page: any(named: 'page'),
          ),
        ).thenAnswer((_) async => const Right([]));
        return moviesCubit;
      },
      act: (cubit) => cubit.paginateMovies(),
      expect: () => [
        const MoviesState.loadingMore(),
        const MoviesState.loaded([]),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'getMovieById throws exception when getMovieById fails',
      setUp: () {
        when(() {
          return moviesService.getMovieById(id: any(named: 'id'));
        }).thenAnswer((_) async => const Left(Failure()));
      },
      build: () => moviesCubit,
      act: (cubit) => cubit.getMovieById(id: '1'),
      errors: () => [isA<Exception>()],
    );

    blocTest<MoviesCubit, MoviesState>(
      'getMovieById returns movie when getMovieById succeeds',
      setUp: () {
        when(() => moviesService.getMovieById(id: any(named: 'id')))
            .thenAnswer((_) async => const Right(Movie()));
      },
      build: () => moviesCubit,
      act: (cubit) => cubit.getMovieById(id: '1'),
      expect: () => const <MoviesState>[],
    );
  });
}
