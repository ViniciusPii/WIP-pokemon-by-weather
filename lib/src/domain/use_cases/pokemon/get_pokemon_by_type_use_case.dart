import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

abstract class GetPokemonByTypeUseCase {
  Future<PokemonEntity> call(String type);
}
