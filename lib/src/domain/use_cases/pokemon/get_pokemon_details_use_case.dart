import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';

abstract class GetPokemonDetailsUseCase {
  Future<PokemonDetailsEntity> call(String path);
}
