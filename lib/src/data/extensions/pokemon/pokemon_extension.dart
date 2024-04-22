import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

extension PokemonExtension on PokemonEntity {
  static PokemonEntity fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      pathDetails: map['pokemon']['url'] ?? '',
    );
  }
}
