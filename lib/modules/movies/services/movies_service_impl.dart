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
      if (name.isEmpty) return const Right(<Movie>[]);
      final params = {'s': name, 'page': page};
      final response = await _baseApi.getData(
        EndPoints.baseUrl,
        queryParameters: params,
      );
      return response.fold(Left.new, (r) {
        final result = r.data as Map<String, dynamic>;
        final isRejected = result['Response'] == 'False';
        if (isRejected) {
          final message = result['Error'] as String? ?? '';
          return Left(Failure(message: message));
        } else {
          final data = result['Search'] as List<dynamic>;
          final castedData = List<Map<String, dynamic>>.from(data);
          return Right(castedData.map(Movie.fromJson).toList());
        }
      });
    } catch (e) {
      log('Request Failed ====>$e', error: e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieById({
    required String id,
  }) async {
    try {
      final params = {'i': id};
      final response = await _baseApi.getData(
        EndPoints.baseUrl,
        queryParameters: params,
      );
      return response.fold(Left.new, (r) {
        final result = r.data as Map<String, dynamic>;
        final isRejected = result['Response'] == 'False';
        if (isRejected) {
          final message = result['Error'] as String? ?? '';
          return Left(Failure(message: message));
        } else {
          final json = r.data as Map<String, dynamic>;
          return Right(Movie.fromJson(json));
        }
      });
    } catch (e) {
      log('Request Failed ====>$e', error: e);
      return Left(Failure(message: e.toString()));
    }
  }
}
