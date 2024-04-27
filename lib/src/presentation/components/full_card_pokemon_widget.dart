import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_by_weather/src/app_env.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/components/bg_rotate_widget.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/pokemon_helpers.dart';

class FullCardPokemonWidget extends StatelessWidget {
  const FullCardPokemonWidget({
    super.key,
    required this.type,
    required this.pokemon,
  });

  final PokemonType type;
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.style.colorLight,
        borderRadius: BorderRadius.circular(
          AppDimension.medium,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: -40,
            child: BgRotateWidget(
              size: 150,
              color: type.style.color,
            ),
          ),
          Positioned(
            left: 16,
            top: 18,
            child: Image.asset(
              'assets/dots.png',
              height: 55,
              color: type.style.color.withOpacity(0.35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.medium,
              horizontal: AppDimension.medium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      type.style.icon,
                      color: type.style.color,
                      height: AppDimension.mega,
                    ),
                    const SizedBox(
                      width: AppDimension.medium,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLabel(
                          type: LabelType.small,
                          color: type.style.colorDark,
                          label: '#${pokemon.displayId}',
                        ),
                        AppLabel(
                          label: pokemon.displayName,
                          color: type.style.colorDark,
                        ),
                      ],
                    ),
                  ],
                ),
                Image.network(
                  AppEnv.pokemonImage(
                    pokemon.displayId,
                  ),
                  height: AppDimension.enormous,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
