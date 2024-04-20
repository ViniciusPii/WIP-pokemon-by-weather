import 'package:get_it/get_it.dart';
import 'package:pokemon_by_weather/src/core/external/http_service.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/impl/weather_data_source_impl.dart';
import 'package:pokemon_by_weather/src/data/data_sources/weather/weather_data_source.dart';
import 'package:pokemon_by_weather/src/data/repositories/weather/impl/weather_repository_impl.dart';
import 'package:pokemon_by_weather/src/data/repositories/weather/weather_repository.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/get_weather_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/weather/impl/get_weather_by_city_use_case_impl.dart';
import 'package:pokemon_by_weather/src/external/dio_http_service_impl.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_cubit.dart';

final GetIt di = GetIt.instance;

class AppDI {
  AppDI._();

  static configure() {
    _configureServices();
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureControllers();
  }

  static void _configureServices() {
    di.registerLazySingleton<HttpService>(
      () => DioHttpServiceImpl(),
    );
  }

  static void _configureDataSources() {
    di.registerLazySingleton<WeatherDataSource>(
      () => WeatherDataSourceImpl(http: di.get()),
    );
  }

  static void _configureRepositories() {
    di.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(dataSource: di.get()),
    );
  }

  static void _configureUseCases() {
    di.registerLazySingleton<GetWeatherByCityUseCase>(
      () => GetWeatherByCityUseCaseImpl(repository: di.get()),
    );
  }

  static void _configureControllers() {
    di.registerFactory(
      () => HomePokemonCubit(getWeatherByCityUseCase: di.get()),
    );
  }
}
