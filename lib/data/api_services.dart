import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_morty/data/models/person_model.dart';

class ApiServices {
  var url = Uri.parse('https://my-json-server.typicode.com/DmGurin/planet_community/planets/');

  Future<List<Person>> getPersonModel() async {
    var response = await http.get(url);
    final str = utf8.decode(response.bodyBytes);
    return personListFromJson(str);
  }
}