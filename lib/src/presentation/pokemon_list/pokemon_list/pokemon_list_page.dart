import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_by_weather/src/core/theme/app_styles.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/base_bloc_state.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';
import 'package:pokemon_by_weather/src/core/ui/components/spacing_page.dart';
import 'package:pokemon_by_weather/src/core/ui/components/three_bounce_component.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/pokemon_list/pokemon_list/controller/pokemon_list_cubit.dart';
import 'package:pokemon_by_weather/src/presentation/pokemon_list/pokemon_list/controller/pokemon_list_state.dart';
import 'package:pokemon_by_weather/src/presentation/widgets/full_card_pokemon_widget.dart';

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
      appBar: AppBar(
        elevation: 0,
        title: const AppTitle(title: 'Pokemons'),
        centerTitle: true,
        foregroundColor: AppStyles.primary,
        backgroundColor: AppStyles.background,
      ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppDimension.large,
                  ),
                  const AppTitle(title: 'Confira todos os seus pokemons!'),
                  const SizedBox(
                    height: AppDimension.medium,
                  ),
                  const AppLabel(
                    label:
                        'Esses são todos os pokemons que você poderia ter capturado na sua jornada! Não se preocupe se o seu preferido não apareceu, em breve ele poderá te fazer uma surpresa!',
                    isCenter: false,
                  ),
                  const SizedBox(
                    height: AppDimension.large,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimension.large,
                      ),
                      itemCount: state.pokemons.length,
                      itemBuilder: (context, index) {
                        final PokemonEntity pokemon = state.pokemons[index];

                        return FullCardPokemonWidget(
                          type: widget.type,
                          pokemon: pokemon,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: AppDimension.large,
                      ),
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
