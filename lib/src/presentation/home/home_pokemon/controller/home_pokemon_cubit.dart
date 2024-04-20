import 'package:bloc/bloc.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/get_weather_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonCubit extends Cubit<HomePokemonState> {
  HomePokemonCubit({
    required GetWeatherByCityUseCase getWeatherByCityUseCase,
  })  : _getWeatherByCityUseCase = getWeatherByCityUseCase,
        super(const HomePokemonInitialState());

  final GetWeatherByCityUseCase _getWeatherByCityUseCase;

  Future<void> getWeatherByCity(String city) async {
    emit(const HomePokemonLoadingState());

    final WeatherEntity weather = await _getWeatherByCityUseCase(city);
    emit(HomePokemonSuccessState(weather: weather));
  }
}
