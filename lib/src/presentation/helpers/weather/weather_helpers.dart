import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

extension WeatherConditionDisplayNameExtension on WeatherEntity {
  String get conditionDisplay {
    if (condition == 'Rain') {
      return 'está chovendo';
    }

    return 'não está chovendo';
  }
}
