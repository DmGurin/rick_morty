import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/episode_bloc/episode_event.dart';
import 'package:rick_morty/blocs/episode_bloc/episode_state.dart';
import 'package:rick_morty/data/models/episode_model.dart';
import 'package:rick_morty/repo/repository.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final repository = Repository();
  List<EpisodeModel> episodeList = [];

  EpisodesBloc() : super(InitialEpisodesState()) {
    on<InitialEpisodesEvent>(_onInitialEpisodesEvent);
    on<SelectedSeasonEvent>(_onSelectedSeasonEvent);
  }

  void _onInitialEpisodesEvent(
    InitialEpisodesEvent event,
    Emitter<EpisodesState> emit,
  ) async {
    emit(LoadingEpisodesState());
    try {
      episodeList = await repository.getEpisodeModel('0');
    } catch (ex) {
      emit(ErrorEpisodesState(error: ex.toString()));
    }
    emit(DataEpisodesState(episodes: episodeList));
  }
  void _onSelectedSeasonEvent(
      SelectedSeasonEvent event,
      Emitter<EpisodesState> emit,
      ) async {
    // emit(LoadingSeasonsState());
    try {
      print(event.index);
      episodeList = await repository.getEpisodeModel(event.index.toString());
    } catch (ex) {
      emit(ErrorEpisodesState(error: ex.toString()));

    }
    emit(DataEpisodesState(episodes: episodeList),);
  }
}
