import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/app_env.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/core/widgets/bg_rotate_widget.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/pokemon_helpers.dart';

class CardPokemonWidget extends StatelessWidget {
  const CardPokemonWidget({
    super.key,
    required this.type,
    required this.pokemon,
  });

  final PokemonType type;
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: type.style.colorLight,
          borderRadius: BorderRadius.circular(
            AppDimension.medium,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -35,
              right: 0,
              child: BgRotateWidget(
                size: 150,
                color: type.style.color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimension.medium),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLabel(
                      label: '#${pokemon.displayId}',
                      type: LabelType.small,
                      color: type.style.colorDark,
                    ),
                    AppLabel(
                      label: pokemon.displayName,
                      color: type.style.colorDark,
                    ),
                    Image.network(
                      AppEnv.pokemonImage(
                        pokemon.displayId,
                      ),
                      height: 68,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
