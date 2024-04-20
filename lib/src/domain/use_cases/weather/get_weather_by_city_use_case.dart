import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

abstract class GetWeatherByCityUseCase {
  Future<WeatherEntity> call(String city);
}
