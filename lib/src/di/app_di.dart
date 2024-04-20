import 'package:get_it/get_it.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_cubit.dart';

final GetIt di = GetIt.instance;

class AppDI {
  AppDI._();

  static configure() {
    _configureControllers();
  }

  static void _configureControllers() {
    di.registerFactory(() => HomePokemonCubit());
  }
}
