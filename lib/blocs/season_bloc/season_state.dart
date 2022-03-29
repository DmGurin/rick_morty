


import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/models/episode_model.dart';

abstract class SeasonsState extends Equatable{
  const SeasonsState();
  @override
  List<Object?> get props => [];
}

class InitialSeasonsState extends SeasonsState{}

class LoadingSeasonsState extends SeasonsState{}

class ErrorSeasonsState extends SeasonsState{
  const ErrorSeasonsState({
    required this.error,
});
  final String error;

  @override
  List<Object?> get props => [error];
}

class DataSeasonsState extends SeasonsState{
  const DataSeasonsState({
    required this.seasons,
});
  final List<EpisodeModel> seasons;

  @override
  List<Object?> get props => [seasons];
}