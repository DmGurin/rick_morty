

import 'package:rick_morty/data/api_services.dart';
import 'package:rick_morty/data/models/person_model.dart';

class Repository {
  final apiServices = ApiServices();

  Future<List<Person>> getPersonModel() async {
    var response = await apiServices.getPersonModel();
    return response;
  }
}