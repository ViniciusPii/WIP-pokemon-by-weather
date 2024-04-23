import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';

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
    required this.type,
    required this.weather,
    required this.pokemonToCatch,
    required this.pokemonsRunningAway,
  });

  final PokemonType type;
  final WeatherEntity weather;
  final PokemonEntity pokemonToCatch;
  final List<PokemonEntity> pokemonsRunningAway;
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
