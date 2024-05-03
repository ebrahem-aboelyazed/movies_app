import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/core.dart';

/// Abstract class defining the structure for making HTTP requests.
abstract class BaseApi {
  /// Sends a POST request to the specified endpoint.
  ///
  /// Parameters:
  ///   - [endpoint] (String):
  ///   The API endpoint to which the request will be sent.
  ///   - [data] (Object?, optional):
  ///   The data to be sent with the request body.
  ///   - [queryParameters] (Map<String, dynamic>?, optional):
  ///   Additional query parameters to be included in the request URL.
  ///   - [options] (Options?, optional): Additional options for the request.
  ///   - [cancelToken] (CancelToken?, optional):
  ///   Token used to cancel the request.
  ///   - [onSendProgress] (ProgressCallback?, optional):
  ///   Callback for tracking the progress of sending the request.
  ///   - [onReceiveProgress] (ProgressCallback?, optional):
  ///   Callback for tracking the progress of receiving the response.
  ///
  /// Returns:
  ///   A Future that resolves to either a `Failure` or a `Response<dynamic>`.
  Future<Either<Failure, Response<dynamic>>> postData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  /// Sends a GET request to the specified endpoint.
  ///
  /// Parameters:
  ///   - [endpoint] (String):
  ///   The API endpoint to which the request will be sent.
  ///   - [data] (Object?, optional):
  ///   The data to be sent with the request body.
  ///   - [queryParameters] (Map<String, dynamic>?, optional):
  ///   Additional query parameters to be included in the request URL.
  ///   - [options] (Options?, optional): Additional options for the request.
  ///   - [cancelToken] (CancelToken?, optional):
  ///   Token used to cancel the request.
  ///   - [onReceiveProgress] (ProgressCallback?, optional):
  ///   Callback for tracking the progress of receiving the response.
  ///
  /// Returns: A Future that resolves to
  /// either a `Failure` or a `Response<dynamic>`.
  Future<Either<Failure, Response<dynamic>>> getData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  /// Sends a PUT request to the specified endpoint.
  ///
  /// Parameters:
  ///   - [endpoint] (String):
  ///   The API endpoint to which the request will be sent.
  ///   - [data] (Object?, optional):
  ///   The data to be sent with the request body.
  ///   - [queryParameters] (Map<String, dynamic>?, optional):
  ///   Additional query parameters to be included in the request URL.
  ///   - [options] (Options?, optional): Additional options for the request.
  ///   - [cancelToken] (CancelToken?, optional):
  ///   Token used to cancel the request.
  ///   - [onSendProgress] (ProgressCallback?, optional):
  ///   Callback for tracking the progress of sending the request.
  ///   - [onReceiveProgress] (ProgressCallback?, optional):
  ///   Callback for tracking the progress of receiving the response.
  ///
  /// Returns: A Future that resolves to
  /// either a `Failure` or a `Response<dynamic>`.
  Future<Either<Failure, Response<dynamic>>> putData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  /// Sends a DELETE request to the specified endpoint.
  ///
  /// Parameters:
  ///   - [endpoint] (String):
  ///   The API endpoint to which the request will be sent.
  ///   - [data] (Object?, optional):
  ///   The data to be sent with the request body.
  ///   - [queryParameters] (Map<String, dynamic>?, optional):
  ///   Additional query parameters to be included in the request URL.
  ///   - [options] (Options?, optional): Additional options for the request.
  ///   - [cancelToken] (CancelToken?, optional):
  ///   Token used to cancel the request.
  ///
  /// Returns: A Future that resolves to
  /// either a `Failure` or a `Response<dynamic>`.
  Future<Either<Failure, Response<dynamic>>> deleteData(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  /// Handles the HTTP response and returns
  /// either a `Failure` or a `Response<dynamic>`.
  ///
  /// Parameters:
  ///   - `response` (Response<dynamic>):
  ///   The HTTP response received from the server.
  ///
  /// Returns: Either a `Failure` or a `Response<dynamic>`.
  Either<Failure, Response<dynamic>> handleResponse(Response<dynamic> response);
}
