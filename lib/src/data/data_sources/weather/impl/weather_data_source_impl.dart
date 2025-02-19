import 'package:pokemon_by_weather/src/app_env.dart';
import 'package:pokemon_by_weather/src/core/errors/app_exceptions.dart';
import 'package:pokemon_by_weather/src/core/external/app_client_response.dart';
import 'package:pokemon_by_weather/src/core/external/http_service.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/errors/weather_exceptions.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/weather_data_source.dart';
import 'package:pokemon_by_weather/src/data/extensions/weather_extension.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl({
    required HttpService http,
  }) : _http = http;

  final HttpService _http;

  @override
  Future<WeatherEntity> weatherByCity(String city) async {
    String baseUrl = '${AppEnv.weatherBaseUrl}?appid=${AppEnv.weatherKey}&q=$city&units=metric';

    try {
      final AppClientResponse response = await _http.get(baseUrl);

      final WeatherEntity weather = WeatherExtension.fromMap(response.data);

      return weather;
    } on AppNetworkException catch (_) {
      throw WeatherNetworkException(
        message: 'Verifique a sua conexão!',
      );
    } on AppException catch (e) {
      if (e.statusCode == 404) {
        throw WeatherNotFoundException(
          message: 'Cidade não encontrada!',
        );
      }

      throw WeatherException(message: 'Algo deu errado! Por favor tente mais tarde!');
    } catch (e) {
      throw WeatherException(message: 'Algo deu errado! Por favor tente mais tarde!');
    }
  }
}
