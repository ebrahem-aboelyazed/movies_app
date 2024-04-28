import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/utils/utils.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 10),
          queryParameters: {
            'apiKey': dotenv.env[AppConstants.omdbApiKeyName],
          },
        ),
      );
}
