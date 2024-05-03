import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/core/core.dart';

/// Interceptor for caching API responses.
class ApiCacheInterceptor implements Interceptor {
  ApiCacheInterceptor(this._apiCacheManager);

  final ApiCacheManager _apiCacheManager;

  /// Generates a cache key based on the request options.
  ///
  /// Parameters:
  ///   - [options] (RequestOptions): The request options.
  ///
  /// Returns:
  ///   A String representing the cache key.
  String _generateCacheKey(RequestOptions options) {
    return options.uri.toString();
  }

  /// Called when an exception was occurred during the request.
  ///
  /// Parameters:
  ///   - [error] (DioException): The error that occurred.
  ///   - [handler] (ErrorInterceptorHandler): The error interceptor handler.
  ///
  /// Returns:
  ///   Resolves the error with cached response if available,
  ///   otherwise passes the error to the next handler.
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

  /// Called when the request is about to be sent.
  ///
  /// Parameters:
  ///   - [options] (RequestOptions): The request options.
  ///   - [handler] (RequestInterceptorHandler):
  ///   The request interceptor handler.
  ///
  /// Returns:
  ///   Passes the request options to
  ///   the next handler after setting accept header.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Calling ${options.uri}');
    options.headers['accept'] = 'application/json';
    handler.next(options);
  }

  /// Called when the response is about to be resolved.
  ///
  /// Parameters:
  ///   - [response] (Response<dynamic>):
  ///   The API response.
  ///   - [handler] (ResponseInterceptorHandler):
  ///   The response interceptor handler.
  ///
  /// Returns:
  ///   Passes the response to the next handler after caching it if necessary.
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
