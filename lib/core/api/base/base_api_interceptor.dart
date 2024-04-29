import 'dart:developer';

import 'package:dio/dio.dart';

class BaseApiInterceptor implements Interceptor {
  BaseApiInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['content-type'] = 'application/json';
    options.headers['accept'] = 'application/json';
    log('Calling ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }
}
