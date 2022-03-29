
import 'package:meta/meta.dart';
import 'dart:convert';

Episode episodeFromJson(String str) => Episode.fromJson(json.decode(str));

String episodeToJson(Episode data) => json.encode(data.toJson());

class Episode {
  Episode({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<EpisodeModel> results;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    info: Info.fromJson(json["info"]),
    results: List<EpisodeModel>.from(json["results"].map((x) => EpisodeModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class EpisodeModel {
  EpisodeModel({
    required this.id,
    this.image = 'https://irl.by/wp-content/uploads/2017/08/52_nc7DbtMU-850x607.jpg',
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  final int id;
  final String? image;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
    id: json["id"],
    name: json["name"],
    airDate: json["air_date"],
    episode: json["episode"],
    characters: List<String>.from(json["characters"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "air_date": airDate,
    "episode": episode,
    "characters": List<dynamic>.from(characters.map((x) => x)),
    "url": url,
    "created": created.toIso8601String(),
  };
}
