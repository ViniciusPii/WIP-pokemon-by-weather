import 'package:bloc/bloc.dart';
import 'package:pokemon_by_weather/src/data/data_sources/pokemon/errors/pokemon_exceptions.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/errors/weather_exceptions.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_by_type_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_type_by_temp_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_two_pokemons_by_type_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/get_weather_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonCubit extends Cubit<HomePokemonState> {
  HomePokemonCubit({
    required GetWeatherByCityUseCase getWeatherByCityUseCase,
    required GetPokemonByTypeUseCase getPokemonByTypeUseCase,
    required GetPokemonTypeByTempUseCase getPokemonTypeByTempUseCase,
    required GetTwoPokemonsByTypeUseCase getTwoPokemonsByTypeUseCase,
  })  : _getWeatherByCityUseCase = getWeatherByCityUseCase,
        _getPokemonByTypeUseCase = getPokemonByTypeUseCase,
        _getTwoPokemonsByTypeUseCase = getTwoPokemonsByTypeUseCase,
        _getPokemonTypeByTempUseCase = getPokemonTypeByTempUseCase,
        super(const HomePokemonInitialState());

  final GetWeatherByCityUseCase _getWeatherByCityUseCase;
  final GetPokemonByTypeUseCase _getPokemonByTypeUseCase;
  final GetPokemonTypeByTempUseCase _getPokemonTypeByTempUseCase;
  final GetTwoPokemonsByTypeUseCase _getTwoPokemonsByTypeUseCase;

  Future<void> getWeatherByCity(String city) async {
    emit(const HomePokemonLoadingState());

    try {
      final WeatherEntity weather = await _getWeatherByCityUseCase(city);

      final PokemonType type = _getPokemonTypeByTempUseCase(weather.temp, weather.condition);

      final PokemonEntity pokemonToCatch = await _getPokemonByTypeUseCase(type.name);

      final List<PokemonEntity> pokemonsRunningAway = await _getTwoPokemonsByTypeUseCase(type.name);

      emit(HomePokemonSuccessState(
        type: type,
        weather: weather,
        pokemonToCatch: pokemonToCatch,
        pokemonsRunningAway: pokemonsRunningAway,
      ));
    } on WeatherNotFoundException catch (e) {
      emit(HomePokemonWeatherErrorState(message: e.message));
    } on WeatherException catch (e) {
      emit(HomePokemonWeatherErrorState(message: e.message));
    } on WeatherNetworkException catch (e) {
      emit(HomePokemonWeatherNetworkErrorState(message: e.message));
    } on PokemonException catch (e) {
      emit(HomePokemonErrorState(message: e.message));
    }
  }
}
