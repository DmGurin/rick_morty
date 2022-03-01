import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/person_bloc/person_event.dart';
import 'package:rick_morty/blocs/person_bloc/person_state.dart';
import 'package:rick_morty/data/models/person_model.dart';
import 'package:rick_morty/repo/repository.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final repository = Repository();
  List<PersonModel> personList = [];

  PersonsBloc() : super(InitialPersonsState()) {
    on<InitialPersonsEvent>(_onInitialPersonsEvent);
  }

  void _onInitialPersonsEvent(
    InitialPersonsEvent event,
    Emitter<PersonsState> emit,
  ) async {
    emit(LoadingPersonsState());
    try {
      personList = await repository.getPersonModel();
    } catch (ex) {
      emit(ErrorPersonState(error: ex.toString()));
    }
    emit(DataPersonsState(persons: personList));
  }
}
