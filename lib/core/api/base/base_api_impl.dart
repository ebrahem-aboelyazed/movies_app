import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/core.dart';

@Singleton(as: BaseApi)
class BaseApiImpl implements BaseApi {
  BaseApiImpl(
    this._dio,
    this._apiCacheManager,
  );

  final Dio _dio;
  final ApiCacheManager _apiCacheManager;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _dio.interceptors.add(ApiCacheInterceptor(_apiCacheManager));
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
