import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_by_weather/src/core/ui/base_bloc_state.dart';
import 'package:pokemon_by_weather/src/core/ui/components/three_bounce_component.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_cubit.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonPage extends StatefulWidget {
  const HomePokemonPage({super.key});

  @override
  State<HomePokemonPage> createState() => _HomePokemonPageState();
}

class _HomePokemonPageState extends BaseBlocState<HomePokemonPage, HomePokemonCubit> {
  @override
  void onReady(BuildContext context) {
    super.onReady(context);
    controller.getWeatherByCity('itapira');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePokemonCubit, HomePokemonState>(
        bloc: controller,
        builder: (context, state) {
          if (state is HomePokemonLoadingState) {
            return const Center(
              child: ThreeBounceComponent(),
            );
          }

          if (state is HomePokemonSuccessState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.weather.condition),
                  Text(state.weather.temp.toString()),
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
