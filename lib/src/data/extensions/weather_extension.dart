import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

extension WeatherExtension on WeatherEntity {
  static WeatherEntity fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      temp: map['main']['temp']?.toDouble() ?? 0.0,
      condition: map['weather'][0]['main'] ?? '',
    );
  }
}
