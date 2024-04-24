import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_by_weather/src/app_env.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/base_bloc_state.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';
import 'package:pokemon_by_weather/src/core/ui/components/spacing_page.dart';
import 'package:pokemon_by_weather/src/core/ui/components/three_bounce_component.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/pokemon_helpers.dart';
import 'package:pokemon_by_weather/src/presentation/pokemon_list/pokemon_list/controller/pokemon_list_cubit.dart';
import 'package:pokemon_by_weather/src/presentation/pokemon_list/pokemon_list/controller/pokemon_list_state.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({
    super.key,
    required this.type,
  });

  final PokemonType type;

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends BaseBlocState<PokemonListPage, PokemonListCubit> {
  @override
  void onReady(BuildContext context) {
    super.onReady(context);
    controller.getAllPokemonsByType(widget.type.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PokemonListCubit, PokemonListState>(
        bloc: controller,
        builder: (context, state) {
          if (state is PokemonListLoadingState) {
            return const Center(
              child: ThreeBounceComponent(),
            );
          }

          if (state is PokemonListSuccessState) {
            return SpacingPage(
              child: Column(
                children: [
                  const SizedBox(
                    height: AppDimension.jumbo,
                  ),
                  const AppTitle(title: 'Confira todos os seus pokemons!'),
                  const SizedBox(
                    height: AppDimension.large,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.pokemons.length,
                      itemBuilder: (context, index) {
                        final PokemonEntity pokemon = state.pokemons[index];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  height: AppDimension.big,
                                  widget.type.style.icon,
                                  color: widget.type.style.color,
                                ),
                                AppTitle(
                                  title: (pokemon.displayId),
                                ),
                                const SizedBox(
                                  width: AppDimension.medium,
                                ),
                                AppTitle(
                                  title: (pokemon.displayName),
                                ),
                              ],
                            ),
                            Image.network(
                              AppEnv.pokemonImage(
                                pokemon.displayId,
                              ),
                              height: 80,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
