import 'package:pokemon_by_weather/src/data/repositories/weather/weather_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/get_weather_by_city_use_case.dart';

class GetWeatherByCityUseCaseImpl implements GetWeatherByCityUseCase {
  GetWeatherByCityUseCaseImpl({
    required WeatherRepository repository,
  }) : _repository = repository;

  final WeatherRepository _repository;

  @override
  Future<WeatherEntity> call(String city) async => await _repository.weatherByCity(city);
}
