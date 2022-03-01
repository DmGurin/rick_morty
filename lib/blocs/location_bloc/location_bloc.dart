import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/location_bloc/location_event.dart';
import 'package:rick_morty/blocs/location_bloc/location_state.dart';
import 'package:rick_morty/data/models/location_model.dart';
import 'package:rick_morty/repo/repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final repository = Repository();
  List<Location> locationList = [];

  LocationBloc() : super(InitialLocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
  }

  void _onInitialLocationEvent(
    InitialLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LoadingLocationState());
    try {
      locationList = await repository.getLocation();
    } catch (ex) {
      emit(ErrorLocationState(error: ex.toString()));
    }
    emit(DataLocationState(locations: locationList));
  }
}
