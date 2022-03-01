import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_morty/data/models/location_model.dart';
import 'package:rick_morty/data/models/person_model.dart';

class ApiServices {
  var url = 'https://rickandmortyapi.com/api/';

  Future<List<PersonModel>> getPersons() async {
    var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/'));
    final json = utf8.decode(response.bodyBytes);
    return personListFromJson(json);
  }

  Future<List<Location>> getLocation() async {
    var response = await http.get(Uri.parse(url + 'location/'));
    final json = utf8.decode(response.bodyBytes);
    return locationListFromJson(json);
  }
}
