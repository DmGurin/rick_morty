import 'package:flutter/material.dart';

@immutable
abstract class SeasonsEvent {}

class InitialSeasonsEvent extends SeasonsEvent {}

class SelectedSeasonEvent extends SeasonsEvent {
  SelectedSeasonEvent({required this.index});

  final int index;
}
