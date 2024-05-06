import 'package:dio/dio.dart';
import 'package:pokemon_by_weather/src/external/interceptors/logging_interceptor.dart';

import '/src/core/errors/app_exceptions.dart';
import '/src/core/external/app_client_response.dart';
import '/src/core/external/http_service.dart';

class DioHttpServiceImpl implements HttpService {
  DioHttpServiceImpl() {
    _dio = Dio();
    _dio.interceptors.add(LoggingInterceptor());
  }

  late final Dio _dio;

  @override
  Future<AppClientResponse<T>> get<T>(String path) async {
    try {
      final response = await _dio.get(path);

      final AppClientResponse<T> appCLientResponse = AppClientResponse(
        data: response.data,
        message: response.statusMessage,
        statusCode: response.statusCode,
      );

      return appCLientResponse;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw AppNetworkException();
      }

      if (e.response!.statusCode == 404) {
        throw AppNotFoundException();
      }

      throw AppGenericException();
    }
  }
}
