import 'package:equatable/equatable.dart';

class RadioStation extends Equatable {
  final String uuid;
  final String name;
  final String url;
  final String country;
  final String countryCode;
  final String language;
  final int votes;
  final String tags;
  final double? geoLat;
  final double? geoLong;

  const RadioStation({
    required this.uuid,
    required this.name,
    required this.url,
    required this.country,
    required this.countryCode,
    required this.language,
    required this.votes,
    required this.tags,
    required this.geoLat,
    required this.geoLong,
  });

  RadioStation.fromJson(Map<String, dynamic> json)
      : uuid = json["stationuuid"],
        name = json["name"],
        url = json["url"],
        country = json["country"],
        countryCode = json["countrycode"],
        language = json["language"],
        votes = json["votes"],
        tags = json["tags"],
        geoLat = json["geo_lat"],
        geoLong = json["geo_long"];

  @override
  List<Object?> get props => [uuid, name, geoLat, geoLong];

  @override
  String toString() =>
      "RadioStation { name: $name, country: $country, url: $url }";
}
