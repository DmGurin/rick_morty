import 'package:rick_morty/data/api_services.dart';
import 'package:rick_morty/data/models/location_model.dart';
import 'package:rick_morty/data/models/person_model.dart';

class Repository {
  final apiServices = ApiServices();

  Future<List<PersonModel>> getPersonModel() async {
    var response = await apiServices.getPersons();
    return response;
  }

  Future<List<Location>> getLocation() async {
    var response = await apiServices.getLocation();
    return response;
  }
}
