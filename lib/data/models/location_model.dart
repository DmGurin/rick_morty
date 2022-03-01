import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

List<Location> locationListFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(Location data) => json.encode(data.toJson());


class Location {
  Location({
    this.image = 'https://irl.by/wp-content/uploads/2017/08/52_nc7DbtMU-850x607.jpg',
    required this.name,
    required this.url,
    required this.type,
    required this.dimension,
  });
  final String image;
  final String name;
  final String url;
  final String type;
  final String dimension;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
    type: json["type"],
    dimension: json["dimension"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "type": type,
    "dimension": dimension
  };
}