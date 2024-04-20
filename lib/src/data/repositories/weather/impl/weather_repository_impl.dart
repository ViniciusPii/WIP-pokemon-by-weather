import 'package:pokemon_by_weather/src/data/data_sources/weather/weather_data_source.dart';
import 'package:pokemon_by_weather/src/data/repositories/weather/weather_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherDataSource dataSource,
  }) : _dataSource = dataSource;

  final WeatherDataSource _dataSource;

  @override
  Future<WeatherEntity> weatherByCity(String city) async => await _dataSource.weatherByCity(city);
}
