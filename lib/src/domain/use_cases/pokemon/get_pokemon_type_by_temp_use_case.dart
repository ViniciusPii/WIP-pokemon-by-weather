import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';

abstract class GetPokemonTypeByTempUseCase {
  PokemonType call(double temp, String condition);
}
