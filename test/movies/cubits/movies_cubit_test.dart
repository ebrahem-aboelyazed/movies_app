import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

class MockMoviesService extends Mock implements MoviesService {}

void main() {
  late MockMoviesService mockMoviesService;
  late MoviesCubit moviesCubit;

  setUp(() {
    mockMoviesService = MockMoviesService();
    moviesCubit = MoviesCubit(moviesService: mockMoviesService);
  });

  group('MoviesCubit', () {
    blocTest<MoviesCubit, MoviesState>(
      'emits [loading, loaded] when searchMovies is called and returns movies',
      build: () => moviesCubit,
      setUp: () {
        when(() => mockMoviesService.searchMovies(name: 'Star Wars', page: 1))
            .thenAnswer(
          (invocation) async => const Right(<Movie>[]),
        );
      },
      act: (cubit) => cubit.executeSearch(query: 'Star Wars'),
      expect: () => [
        const MoviesState.loading(),
        isA<MoviesLoaded>(),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'emits [initial] when searchMovies is called with empty query',
      build: () => moviesCubit,
      act: (cubit) => cubit.executeSearch(),
      expect: () => [const MoviesState.initial()],
    );

    blocTest<MoviesCubit, MoviesState>(
      'emits [loading, failure] when searchMovies fails',
      build: () => moviesCubit,
      setUp: () {
        when(
          () => moviesCubit.moviesService.searchMovies(name: 'error', page: 1),
        ).thenAnswer((_) async => const Left(Failure()));
      },
      act: (cubit) => cubit.executeSearch(query: 'error'),
      expect: () => [const MoviesState.loading(), isA<MoviesFailure>()],
    );
  });
}
