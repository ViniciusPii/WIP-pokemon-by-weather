import 'package:bloc/bloc.dart';
import 'package:pokemon_by_weather/src/data/data_sources/pokemon/errors/pokemon_exceptions.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/errors/weather_exceptions.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/get_weather_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonCubit extends Cubit<HomePokemonState> {
  HomePokemonCubit({
    required GetWeatherByCityUseCase getWeatherByCityUseCase,
    required GetPokemonByWeatherUseCase getPokemonByWeatherUseCase,
  })  : _getWeatherByCityUseCase = getWeatherByCityUseCase,
        _getPokemonByWeatherUseCase = getPokemonByWeatherUseCase,
        super(const HomePokemonInitialState());

  final GetWeatherByCityUseCase _getWeatherByCityUseCase;
  final GetPokemonByWeatherUseCase _getPokemonByWeatherUseCase;

  Future<void> getWeatherByCity(String city) async {
    emit(const HomePokemonLoadingState());

    try {
      final WeatherEntity weather = await _getWeatherByCityUseCase(city);

      final PokemonDetailsEntity pokemon =
          await _getPokemonByWeatherUseCase(weather.temp, weather.condition);

      emit(HomePokemonSuccessState(weather: weather, pokemon: pokemon));
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
