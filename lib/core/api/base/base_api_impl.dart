import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

@Singleton(as: BaseApi)
class BaseApiImpl implements BaseApi {
  BaseApiImpl(
    this._dio,
  );

  final Dio _dio;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final cacheDir = await getTemporaryDirectory();
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(
        cacheDir.path,
        hiveBoxName: AppConstants.cacheBox,
      ),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) => request.uri.toString(),
    );
    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    _dio.interceptors.add(BaseApiInterceptor());
  }

  @override
  Future<Either<Failure, Response<dynamic>>> postData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse(response);
    } catch (e) {
      log('Request Failed ====>$e');
      return const Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Response<dynamic>>> getData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
      //return handleResponse(response);
    } catch (e) {
      log('Request Failed ====>$e', error: e);
      return const Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Response<dynamic>>> putData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse(response);
    } catch (e) {
      log('Request Failed ====>$e', error: e);
      return const Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Response<dynamic>>> deleteData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      return handleResponse(response);
    } catch (e) {
      log('Request Failed ====>$e', error: e);
      return const Left(Failure());
    }
  }

  @override
  Either<Failure, Response<dynamic>> handleResponse(
    Response<dynamic> response,
  ) {
    final statusCode = response.statusCode;
    switch (statusCode) {
      case RequestStatus.success:
      case RequestStatus.created:
      case RequestStatus.accepted:
      case RequestStatus.noContent:
        return Right(response);
      case RequestStatus.unAuthorized:
        final failure = Failure(
          statusCode: response.statusCode,
          message: 'Unauthorized',
        );
        return Left(failure);
      default:
        final failure = Failure(
          statusCode: response.statusCode,
          message: 'Error',
        );
        return Left(failure);
    }
  }
}
