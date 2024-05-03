import 'package:dartz/dartz.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

/// Abstract class defining methods for interacting with movie-related data.
abstract class MoviesService {
  /// Searches for movies based on the provided [name].
  ///
  /// The [name] parameter is required for a valid search query.
  /// The [page] parameter is optional for pagination.
  ///
  /// Returns a [Future] containing an [Either] with a [Failure] on error
  /// or a list of [Movie] objects representing the search results.
  Future<Either<Failure, List<Movie>>> searchMovies({
    required String name,
    int? page,
  });

  /// Retrieves detailed information about a movie with the specified [id].
  ///
  /// The [id] parameter specifies the unique
  /// identifier of the movie to retrieve.
  ///
  /// Returns a [Future] containing an [Either] with a [Failure] on error
  /// or a [Movie] object representing the retrieved movie.
  Future<Either<Failure, Movie>> getMovieById({
    required String id,
  });
}
