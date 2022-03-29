import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/person_bloc/person_event.dart';
import 'package:rick_morty/blocs/person_bloc/person_state.dart';
import 'package:rick_morty/data/models/person_model.dart';
import 'package:rick_morty/repo/repository.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final repository = Repository();
  //final x = int.id;
  //final id = PersonModel.fromJson();
  List<PersonModel> personList = [];

  PersonsBloc() : super(InitialPersonsState()) {
    on<InitialPersonsEvent>(_onInitialPersonsEvent);
  }

  Future<List<PersonModel>> _onInitialPersonsEvent(
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
    var listRange =  personList;
    listRange = listRange.getRange(0, 10).toList();
    // if (kDebugMode) {
    //   for (var id in ListRange) {
    //    // print(id);
    //   }
    //     //print (ListRange);
    // }


    // final  id = PersonModel;
    // var List = [personList];
    // var ListRange = id.getRange(0, 11);
    // print('season 1 $ListRange');
    return listRange;
  }

}
