import 'package:dartz/dartz.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

abstract class MoviesService {
  Future<Either<Failure, List<Movie>>> searchMovies({
    /// Required parameter for a valid search query
    required String name,

    /// Optional parameter for pagination
    int? page,
  });
}
