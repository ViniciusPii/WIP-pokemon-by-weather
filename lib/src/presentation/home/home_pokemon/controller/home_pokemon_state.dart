import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';
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
    required this.pokemon,
  });

  final WeatherEntity weather;
  final PokemonDetailsEntity pokemon;
}

//Weather

class HomePokemonWeatherErrorState extends HomePokemonState {
  HomePokemonWeatherErrorState({
    required this.message,
  });

  final String message;
}

class HomePokemonWeatherNetworkErrorState extends HomePokemonState {
  HomePokemonWeatherNetworkErrorState({
    required this.message,
  });

  final String message;
}

//Pokemon
class HomePokemonErrorState extends HomePokemonState {
  HomePokemonErrorState({
    required this.message,
  });

  final String message;
}
