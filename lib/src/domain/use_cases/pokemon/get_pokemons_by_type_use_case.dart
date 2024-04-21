import 'package:pokemon_by_weather/src/domain/entities/pokemon_entity.dart';

abstract class GetPokemonsByTypeUseCase {
  Future<List<PokemonEntity>> call(String type);
}
