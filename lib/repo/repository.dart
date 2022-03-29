import 'package:rick_morty/data/api_services.dart';
import 'package:rick_morty/data/models/episode_model.dart';
import 'package:rick_morty/data/models/location_model.dart';
import 'package:rick_morty/data/models/person_model.dart';

class Repository {
  final apiServices = ApiServices();

  Future<List<PersonModel>> getPersonModel() async {
    var response = await apiServices.getPersons();
    response.sort((a, b) => a.name.compareTo(b.name));
    return response;
  }


  Future<List<Location>> getLocation() async {
    var response = await apiServices.getLocation();
    response.sort((a, b) => a.name.compareTo(b.name));
    return response;
  }
  Future<List<EpisodeModel>> getEpisodeModel(String page) async {
    var response = await apiServices.getEpisodes(page);
    //response.sort((a, b) => a.name.compareTo(b.name));
    return response;
  }
}
