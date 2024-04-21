import 'package:pokemon_by_weather/src/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonsByType(String type);
}
