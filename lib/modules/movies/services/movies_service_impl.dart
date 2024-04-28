import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/modules/movies/movies.dart';

@LazySingleton(as: MoviesService)
class MoviesServiceImpl implements MoviesService {
  const MoviesServiceImpl(this._baseApi);

  final BaseApi _baseApi;

  @override
  Future<Either<Failure, List<Movie>>> searchMovies({
    required String name,
    int? page,
  }) async {
    try {
      final params = {'s': name, 'page': page};
      final response = await _baseApi.getData(
        EndPoints.search,
        queryParameters: params,
      );
      return response.fold(Left.new, (r) {
        final json = r.data as List<dynamic>;
        final castedData = List<Map<String, dynamic>>.from(json);
        return Right(castedData.map(Movie.fromJson).toList());
      });
    } catch (e) {
      log('Request Failed ====>$e', error: e);
      return Left(Failure(message: e.toString()));
    }
  }
}
