import 'package:bloc/bloc.dart';
import 'package:pokemon_by_weather/src/data/data_sources/pokemon/errors/pokemon_exceptions.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/errors/weather_exceptions.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_type_by_temp_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemons_by_type_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/get_weather_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonCubit extends Cubit<HomePokemonState> {
  HomePokemonCubit({
    required GetWeatherByCityUseCase getWeatherByCityUseCase,
    required GetPokemonsByTypeUseCase getPokemonsByTypeUseCaseImpl,
    required GetPokemonTypeByTempUseCase getPokemonTypeByTempUseCase,
  })  : _getWeatherByCityUseCase = getWeatherByCityUseCase,
        _getPokemonTypeByTempUseCase = getPokemonTypeByTempUseCase,
        _getPokemonsByTypeUseCaseImpl = getPokemonsByTypeUseCaseImpl,
        super(const HomePokemonInitialState());

  final GetWeatherByCityUseCase _getWeatherByCityUseCase;
  final GetPokemonsByTypeUseCase _getPokemonsByTypeUseCaseImpl;
  final GetPokemonTypeByTempUseCase _getPokemonTypeByTempUseCase;

  Future<void> getWeatherByCity(String city) async {
    emit(const HomePokemonLoadingState());

    try {
      final WeatherEntity weather = await _getWeatherByCityUseCase(city);

      final PokemonType type = _getPokemonTypeByTempUseCase(weather.temp, weather.condition);

      final List<PokemonEntity> pokemons = await _getPokemonsByTypeUseCaseImpl(type.name);

      emit(HomePokemonSuccessState(weather: weather, pokemons: pokemons));
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
