import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

abstract class GetPokemonsUrlsByTypeUseCase {
  Future<List<PokemonEntity>> call(String type);
}
