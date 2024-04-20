import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> weatherByCity(String city);
}
