import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/models/location_model.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class InitialLocationState extends LocationState {}

class LoadingLocationState extends LocationState {}

class ErrorLocationState extends LocationState {
  const ErrorLocationState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}

class DataLocationState extends LocationState {
  const DataLocationState({
    required this.locations,
  });

  final List<Location> locations;

  @override
  List<Object?> get props => [locations];
}
