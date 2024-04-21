import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_type_by_temp_use_case.dart';

class GetPokemonTypeByTempUseCaseImpl implements GetPokemonTypeByTempUseCase {
  GetPokemonTypeByTempUseCaseImpl();

  @override
  PokemonType call(double temp, String condition) {
    if (condition == 'Rain') {
      return PokemonType.electric;
    }

    if (temp < 5.0) {
      return PokemonType.ice;
    } else if (temp < 10) {
      return PokemonType.water;
    } else if (temp >= 12 && temp <= 15) {
      return PokemonType.grass;
    } else if (temp > 15 && temp <= 21) {
      return PokemonType.ground;
    } else if (temp >= 23 && temp <= 27) {
      return PokemonType.bug;
    } else if (temp > 27 && temp <= 33) {
      return PokemonType.rock;
    } else if (temp > 33) {
      return PokemonType.fire;
    }

    return PokemonType.normal;
  }
}
