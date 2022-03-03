import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/data/models/location_model.dart';
import 'package:rick_morty/data/models/person_model.dart';

class ApiServices {
  var url = 'https://rickandmortyapi.com/api/';

  Future<List<PersonModel>> getPersons() async {
    List<PersonModel> results = [];
    var response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character/'));
    final stringJson = utf8.decode(response.bodyBytes);
    try {
      Map<String, dynamic> mapJson = jsonDecode(stringJson);
      results = List<PersonModel>.from(
        mapJson["results"].map(
          (x) => PersonModel.fromJson(x),
        ),
      );
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
    }
    return results;
  }

  Future<List<Location>> getLocation() async {
    var response = await http.get(Uri.parse(url + 'location/'));
    final json = utf8.decode(response.bodyBytes);
    return locationListFromJson(json);
  }
}
