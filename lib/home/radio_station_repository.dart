import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radio_station/models/radio_station.dart';

// http://91.132.145.114/json/stations?limit=500
// http://91.132.145.114/json/stations/bycountrycodeexact/es?limit=100

class RadioStationRepository {
  Future<List<RadioStation>> getStations() async {
    try {
      const String url = "http://91.132.145.114/json/stations?limit=5000";

      final response = await http.get(
        Uri.parse(url),
        headers: {"Accept": "application/json"},
      );

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final Iterable decodeJson = jsonDecode(response.body);
        final radioStations =
            decodeJson.map((item) => RadioStation.fromJson(item)).toList();

        return radioStations
            .where(
                (station) => station.geoLat != null && station.geoLong != null)
            .toList();
      } else {
        return [];
      }
    } catch (err) {
      throw "Error while making a LoginRequest to server. Error: $err";
    }
  }
}
