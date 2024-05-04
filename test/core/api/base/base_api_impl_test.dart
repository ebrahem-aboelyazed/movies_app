import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/core.dart';

class MockDio extends Mock implements Dio {}

class MockApiCacheManager extends Mock implements ApiCacheManager {}

void main() {
  late BaseApiImpl baseApi;
  late Dio dio;
  late ApiCacheManager apiCacheManager;

  setUp(() {
    dio = MockDio();
    apiCacheManager = MockApiCacheManager();

    baseApi = BaseApiImpl(dio, apiCacheManager);
  });

  group('BaseApiImpl', () {
    test('init should add interceptors', () async {
      // Mocking Dio interceptors method
      final interceptors = Interceptors();
      when(() => dio.interceptors).thenReturn(interceptors);

      await baseApi.init();

      // Verify that ApiCacheInterceptor are added
      verify(() {
        dio.interceptors.addAll(any(that: isList));
      }).called(1);
    });

    test('postData should return Right response on success', () async {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(),
      );
      when(
        () => dio.post<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await baseApi.postData('endpoint');

      // Assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()), mockResponse);
    });

    test('postData should return Left Failure on error', () async {
      // Arrange
      when(
        () => dio.post<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenThrow(Exception());

      // Act
      final result = await baseApi.postData('endpoint');

      // Assert
      expect(result.isLeft(), true);
    });

    test('getData should return Right response on success', () async {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(),
      );
      when(
        () => dio.get<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await baseApi.getData('endpoint');

      // Assert
      expect(result.isRight(), true);
    });

    test('getData should return Left Failure on error', () async {
      // Arrange
      when(
        () => dio.get<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenThrow(Exception());

      // Act
      final result = await baseApi.getData('endpoint');

      // Assert
      expect(result.isLeft(), true);
    });

    test('putData should return Right response on success', () async {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(),
      );
      when(
        () => dio.put<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await baseApi.putData('endpoint');

      // Assert
      expect(result.isRight(), true);
    });

    test('putData should return Left Failure on error', () async {
      // Arrange
      when(
        () => dio.put<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenThrow(Exception());

      // Act
      final result = await baseApi.putData('endpoint');

      // Assert
      expect(result.isLeft(), true);
    });

    test('deleteData should return Right response on success', () async {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(),
      );
      when(
        () => dio.delete<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await baseApi.deleteData('endpoint');

      // Assert
      expect(result.isRight(), true);
    });

    test('deleteData should return Left Failure on error', () async {
      // Arrange
      when(
        () => dio.delete<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenThrow(Exception());

      // Act
      final result = await baseApi.deleteData('endpoint');

      // Assert
      expect(result.isLeft(), true);
    });

    test('handleResponse should return Right response on success', () {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(),
      );

      // Act
      final result = baseApi.handleResponse(mockResponse);

      // Assert
      expect(result.isRight(), true);
    });

    test('handleResponse should return Left Failure on unauthorized', () {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: RequestStatus.unAuthorized,
        requestOptions: RequestOptions(),
      );

      // Act
      final result = baseApi.handleResponse(mockResponse);

      // Assert
      expect(result.isLeft(), true);
    });

    test('handleResponse should return Left Failure on default case', () {
      // Arrange
      final mockResponse = Response<dynamic>(
        data: {'key': 'value'},
        statusCode: 400,
        requestOptions: RequestOptions(),
      );

      // Act
      final result = baseApi.handleResponse(mockResponse);

      // Assert
      expect(result.isLeft(), true);
    });
  });
}
