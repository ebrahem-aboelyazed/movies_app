class ServerException implements Exception {
  ServerException(this.errMessage);

  final String errMessage;
}

class CacheException implements Exception {}

class NetworkException implements Exception {}
