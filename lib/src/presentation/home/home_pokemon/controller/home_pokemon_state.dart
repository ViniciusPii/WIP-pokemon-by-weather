import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';

sealed class HomePokemonState {
  const HomePokemonState();
}

class HomePokemonInitialState extends HomePokemonState {
  const HomePokemonInitialState();
}

class HomePokemonLoadingState extends HomePokemonState {
  const HomePokemonLoadingState();
}

class HomePokemonSuccessState extends HomePokemonState {
  HomePokemonSuccessState({
    required this.weather,
  });

  final WeatherEntity weather;
}
