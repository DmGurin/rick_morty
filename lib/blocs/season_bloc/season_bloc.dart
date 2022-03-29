


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/season_bloc/season_event.dart';
import 'package:rick_morty/blocs/season_bloc/season_state.dart';
import 'package:rick_morty/data/models/episode_model.dart';
import 'package:rick_morty/repo/repository.dart';

class SeasonsBloc extends Bloc<SeasonsEvent, SeasonsState>{
  final repository = Repository();
  List<EpisodeModel> seasonList = [];

  SeasonsBloc() : super(InitialSeasonsState()){
    on<InitialSeasonsEvent>(_onInitialSeasonsEvent);
    on<SelectedSeasonEvent>(_onSelectedSeasonsEvent);
  }

  void _onInitialSeasonsEvent(
      InitialSeasonsEvent event,
      Emitter<SeasonsState> emit,
      ) async {
    emit(LoadingSeasonsState());
    try {
      seasonList = await repository.getEpisodeModel('0');
    } catch (ex) {
      emit(ErrorSeasonsState(error: ex.toString()));

    }
    emit(DataSeasonsState(seasons: seasonList),);
  }
  void _onSelectedSeasonsEvent(
      SelectedSeasonEvent event,
      Emitter<SeasonsState> emit,
      ) async {
   // emit(LoadingSeasonsState());
    try {
      seasonList = await repository.getEpisodeModel(event.index.toString());
    } catch (ex) {
      emit(ErrorSeasonsState(error: ex.toString()));

    }
    emit(DataSeasonsState(seasons: seasonList),);
  }
}