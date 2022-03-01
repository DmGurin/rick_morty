import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/models/person_model.dart';

abstract class PersonsState extends Equatable {
  const PersonsState();

  @override
  List<Object?> get props => [];
}

class InitialPersonsState extends PersonsState {}

class LoadingPersonsState extends PersonsState {}

class ErrorPersonState extends PersonsState {
  const ErrorPersonState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}

class DataPersonsState extends PersonsState {
  const DataPersonsState({
    required this.persons,
  });

  final List<PersonModel> persons;

  @override
  List<Object?> get props => [persons];
}
