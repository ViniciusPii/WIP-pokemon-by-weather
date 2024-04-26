import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/theme/pokemon_colors.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/theme/pokemon_style.dart';

extension PokemonDisplayNameExtension on PokemonEntity {
  String get displayName {
    List<String> words = name.split(RegExp(r'[\s-]'));

    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return '';
    }).toList();

    final displayName = words.join(' ');

    return displayName;
  }
}

extension PokemonDisplayIdExtension on PokemonEntity {
  String get displayId {
    return id.padLeft(3, '0');
  }
}

extension PokemonStyleExtension on PokemonType {
  PokemonStyle get style {
    switch (this) {
      case PokemonType.ice:
        return PokemonStyle(
          color: PokemonColors.ice600,
          icon: 'assets/types/ice.png',
          colorDark: PokemonColors.ice800,
          colorLight: PokemonColors.ice200,
          displayName: 'Gelo',
        );
      case PokemonType.bug:
        return PokemonStyle(
          color: PokemonColors.bug600,
          icon: 'assets/types/bug.png',
          colorDark: PokemonColors.bug800,
          colorLight: PokemonColors.bug200,
          displayName: 'Inseto',
        );
      case PokemonType.rock:
        return PokemonStyle(
          color: PokemonColors.rock600,
          icon: 'assets/types/rock.png',
          colorDark: PokemonColors.rock800,
          colorLight: PokemonColors.rock200,
          displayName: 'Pedra',
        );
      case PokemonType.fire:
        return PokemonStyle(
          color: PokemonColors.fire600,
          icon: 'assets/types/fire.png',
          colorDark: PokemonColors.fire800,
          colorLight: PokemonColors.fire200,
          displayName: 'Fogo',
        );
      case PokemonType.dark:
        return PokemonStyle(
          color: PokemonColors.dark600,
          icon: 'assets/types/dark.png',
          colorDark: PokemonColors.dark800,
          colorLight: PokemonColors.dark200,
          displayName: 'Sombrio',
        );
      case PokemonType.ghost:
        return PokemonStyle(
          color: PokemonColors.ghost600,
          icon: 'assets/types/ghost.png',
          colorDark: PokemonColors.ghost800,
          colorLight: PokemonColors.ghost200,
          displayName: 'Fantasma',
        );
      case PokemonType.steel:
        return PokemonStyle(
          color: PokemonColors.steel600,
          icon: 'assets/types/steel.png',
          colorDark: PokemonColors.steel800,
          colorLight: PokemonColors.steel200,
          displayName: 'Aço',
        );
      case PokemonType.water:
        return PokemonStyle(
          color: PokemonColors.water600,
          icon: 'assets/types/water.png',
          colorDark: PokemonColors.water800,
          colorLight: PokemonColors.water200,
          displayName: 'Água',
        );
      case PokemonType.grass:
        return PokemonStyle(
          color: PokemonColors.grass600,
          icon: 'assets/types/grass.png',
          colorDark: PokemonColors.grass800,
          colorLight: PokemonColors.grass200,
          displayName: 'Grama',
        );
      case PokemonType.fairy:
        return PokemonStyle(
          color: PokemonColors.fairy600,
          icon: 'assets/types/fairy.png',
          colorDark: PokemonColors.fairy800,
          colorLight: PokemonColors.fairy200,
          displayName: 'Fada',
        );
      case PokemonType.normal:
        return PokemonStyle(
          color: PokemonColors.normal600,
          icon: 'assets/types/normal.png',
          colorDark: PokemonColors.normal800,
          colorLight: PokemonColors.normal200,
          displayName: 'Normal',
        );
      case PokemonType.flying:
        return PokemonStyle(
          color: PokemonColors.flying600,
          icon: 'assets/types/flying.png',
          colorDark: PokemonColors.flying800,
          colorLight: PokemonColors.flying200,
          displayName: 'Voador',
        );
      case PokemonType.poison:
        return PokemonStyle(
          color: PokemonColors.poison600,
          icon: 'assets/types/poison.png',
          colorDark: PokemonColors.poison800,
          colorLight: PokemonColors.poison200,
          displayName: 'Veneno',
        );
      case PokemonType.ground:
        return PokemonStyle(
          color: PokemonColors.ground600,
          icon: 'assets/types/ground.png',
          colorDark: PokemonColors.ground800,
          colorLight: PokemonColors.ground200,
          displayName: 'Terra',
        );
      case PokemonType.dragon:
        return PokemonStyle(
          color: PokemonColors.dragon600,
          icon: 'assets/types/dragon.png',
          colorDark: PokemonColors.dragon800,
          colorLight: PokemonColors.dragon200,
          displayName: 'Dragão',
        );
      case PokemonType.psychic:
        return PokemonStyle(
          color: PokemonColors.psychic600,
          icon: 'assets/types/psychic.png',
          colorDark: PokemonColors.psychic800,
          colorLight: PokemonColors.psychic200,
          displayName: 'Psíquico',
        );
      case PokemonType.fighting:
        return PokemonStyle(
          color: PokemonColors.fighting600,
          icon: 'assets/types/fighting.png',
          colorDark: PokemonColors.fighting800,
          colorLight: PokemonColors.fighting200,
          displayName: 'Lutador',
        );
      case PokemonType.electric:
        return PokemonStyle(
          color: PokemonColors.electric600,
          icon: 'assets/types/electric.png',
          colorDark: PokemonColors.electric800,
          colorLight: PokemonColors.electric200,
          displayName: 'Elétrico',
        );
    }
  }
}
