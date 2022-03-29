import 'package:flutter/material.dart';

@immutable
abstract class EpisodesEvent {}

class InitialEpisodesEvent extends EpisodesEvent {}

class SelectedSeasonEvent extends EpisodesEvent {
  SelectedSeasonEvent({required this.index});

  final int index;
}
