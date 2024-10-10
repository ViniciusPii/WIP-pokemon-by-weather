class AppException implements Exception {
  AppException({this.statusCode});

  final int? statusCode;
}

class AppNetworkException implements Exception {}
