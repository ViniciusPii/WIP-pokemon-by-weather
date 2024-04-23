import 'package:bloc/bloc.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemons_by_type_use_case.dart';
import 'package:pokemon_by_weather/src/presentation/pokemon_list/pokemon_list/controller/pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit({
    required GetPokemonsByTypeUseCase getPokemonsByTypeUseCase,
  })  : _getPokemonsByTypeUseCase = getPokemonsByTypeUseCase,
        super(const PokemonListInitialState());

  final GetPokemonsByTypeUseCase _getPokemonsByTypeUseCase;

  Future<void> getAllPokemonsByType(String type) async {
    emit(const PokemonListLoadingState());

    final List<PokemonEntity> pokemons = await _getPokemonsByTypeUseCase(type);
    emit(PokemonListSuccessState(pokemons: pokemons));
  }
}
