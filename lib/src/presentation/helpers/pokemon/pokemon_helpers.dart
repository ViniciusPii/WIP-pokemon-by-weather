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
          color: PokemonColors.ice,
          icon: 'assets/types/ice.png',
          colorDark: PokemonColors.ice700,
          colorLight: PokemonColors.ice200,
          displayName: 'Gelo',
        );
      case PokemonType.bug:
        return PokemonStyle(
          color: PokemonColors.bug,
          icon: 'assets/types/bug.png',
          colorDark: PokemonColors.bug700,
          colorLight: PokemonColors.bug200,
          displayName: 'Inseto',
        );
      case PokemonType.rock:
        return PokemonStyle(
          color: PokemonColors.rock,
          icon: 'assets/types/rock.png',
          colorDark: PokemonColors.rock700,
          colorLight: PokemonColors.rock200,
          displayName: 'Pedra',
        );
      case PokemonType.fire:
        return PokemonStyle(
          color: PokemonColors.fire,
          icon: 'assets/types/fire.png',
          colorDark: PokemonColors.fire700,
          colorLight: PokemonColors.fire200,
          displayName: 'Fogo',
        );
      case PokemonType.dark:
        return PokemonStyle(
          color: PokemonColors.dark,
          icon: 'assets/types/dark.png',
          colorDark: PokemonColors.dark700,
          colorLight: PokemonColors.dark200,
          displayName: 'Sombrio',
        );
      case PokemonType.ghost:
        return PokemonStyle(
          color: PokemonColors.ghost,
          icon: 'assets/types/ghost.png',
          colorDark: PokemonColors.ghost700,
          colorLight: PokemonColors.ghost200,
          displayName: 'Fantasma',
        );
      case PokemonType.steel:
        return PokemonStyle(
          color: PokemonColors.steel,
          icon: 'assets/types/steel.png',
          colorDark: PokemonColors.steel700,
          colorLight: PokemonColors.steel200,
          displayName: 'Aço',
        );
      case PokemonType.water:
        return PokemonStyle(
          color: PokemonColors.water,
          icon: 'assets/types/water.png',
          colorDark: PokemonColors.water700,
          colorLight: PokemonColors.water200,
          displayName: 'Água',
        );
      case PokemonType.grass:
        return PokemonStyle(
          color: PokemonColors.grass,
          icon: 'assets/types/grass.png',
          colorDark: PokemonColors.grass700,
          colorLight: PokemonColors.grass200,
          displayName: 'Grama',
        );
      case PokemonType.fairy:
        return PokemonStyle(
          color: PokemonColors.fairy,
          icon: 'assets/types/fairy.png',
          colorDark: PokemonColors.fairy700,
          colorLight: PokemonColors.fairy200,
          displayName: 'Fada',
        );
      case PokemonType.normal:
        return PokemonStyle(
          color: PokemonColors.normal,
          icon: 'assets/types/normal.png',
          colorDark: PokemonColors.normal700,
          colorLight: PokemonColors.normal200,
          displayName: 'Normal',
        );
      case PokemonType.flying:
        return PokemonStyle(
          color: PokemonColors.flying,
          icon: 'assets/types/flying.png',
          colorDark: PokemonColors.flying700,
          colorLight: PokemonColors.flying200,
          displayName: 'Voador',
        );
      case PokemonType.poison:
        return PokemonStyle(
          color: PokemonColors.poison,
          icon: 'assets/types/poison.png',
          colorDark: PokemonColors.poison700,
          colorLight: PokemonColors.poison200,
          displayName: 'Veneno',
        );
      case PokemonType.ground:
        return PokemonStyle(
          color: PokemonColors.ground,
          icon: 'assets/types/ground.png',
          colorDark: PokemonColors.ground700,
          colorLight: PokemonColors.ground200,
          displayName: 'Terra',
        );
      case PokemonType.dragon:
        return PokemonStyle(
          color: PokemonColors.dragon,
          icon: 'assets/types/dragon.png',
          colorDark: PokemonColors.dragon700,
          colorLight: PokemonColors.dragon200,
          displayName: 'Dragão',
        );
      case PokemonType.psychic:
        return PokemonStyle(
          color: PokemonColors.psychic,
          icon: 'assets/types/psychic.png',
          colorDark: PokemonColors.psychic700,
          colorLight: PokemonColors.psychic200,
          displayName: 'Psíquico',
        );
      case PokemonType.fighting:
        return PokemonStyle(
          color: PokemonColors.fighting,
          icon: 'assets/types/fighting.png',
          colorDark: PokemonColors.fighting700,
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
