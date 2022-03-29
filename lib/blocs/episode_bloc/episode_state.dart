import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/models/episode_model.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object?> get props => [];
}

class InitialEpisodesState extends EpisodesState {}

class LoadingEpisodesState extends EpisodesState {}

class ErrorEpisodesState extends EpisodesState {
  const ErrorEpisodesState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}

class DataEpisodesState extends EpisodesState {
  const DataEpisodesState({
    required this.episodes,
  });

  final List<EpisodeModel> episodes;

  @override
  List<Object?> get props => [episodes];
}
