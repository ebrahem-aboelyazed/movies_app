import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/core/core.dart';

class ApiCacheInterceptor implements Interceptor {
  ApiCacheInterceptor(this._apiCacheManager);

  final ApiCacheManager _apiCacheManager;

  String _generateCacheKey(RequestOptions options) {
    return options.uri.toString();
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final isTimeOutError = error.type == DioExceptionType.connectionTimeout;
    final isConnectionError = error.type == DioExceptionType.connectionError;
    if (isTimeOutError || isConnectionError) {
      final key = _generateCacheKey(error.requestOptions);
      final cacheResponse = _apiCacheManager.getCachedDataByKey(key);
      if (cacheResponse != null) {
        final response = Response(
          data: cacheResponse,
          statusCode: 200,
          requestOptions: error.requestOptions,
        );
        handler.resolve(response);
        return;
      }
    }
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Calling ${options.uri}');
    options.headers['accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final errorCodes = [
      RequestStatus.unAuthorized,
      RequestStatus.notAllowed,
      RequestStatus.notFound,
      RequestStatus.noContent,
    ];
    final notAllowedToCache = errorCodes.contains(response.statusCode);
    final methodIsNotGet = response.requestOptions.method != 'GET';
    if (methodIsNotGet || notAllowedToCache) {
      handler.next(response);
      return;
    }

    final key = _generateCacheKey(response.requestOptions);
    _apiCacheManager.putDataInCache(key, response.data);
    handler.next(response);
  }
}
