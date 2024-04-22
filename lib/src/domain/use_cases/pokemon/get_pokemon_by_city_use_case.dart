import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';

abstract class GetPokemonByWeatherUseCase {
  Future<PokemonDetailsEntity> call(double temp, String condition);
}
