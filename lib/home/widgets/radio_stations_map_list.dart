import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:radio_station/models/radio_station.dart';
import 'package:radio_station/radio_station_player/cubit/radio_station_player_cubit.dart';
import 'package:radio_station/radio_station_player/view/radio_station_player_view.dart';
import 'package:rive/rive.dart';

class RadioStationMapList extends StatelessWidget {
  final List<RadioStation> radioStations;
  const RadioStationMapList({super.key, required this.radioStations});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 5.0,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/meloalex/clg2acfv0006201mmipmre765/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWVsb2FsZXgiLCJhIjoiY2xnMmEyY3I1MDFkczNmcncwbXBrdTZ0aCJ9.XeD2K1lzrmlMCa8GlLCYUw",
          additionalOptions: const {
            "access_token":
                "pk.eyJ1IjoibWVsb2FsZXgiLCJhIjoiY2xnMmEyY3I1MDFkczNmcncwbXBrdTZ0aCJ9.XeD2K1lzrmlMCa8GlLCYUw",
          },
          userAgentPackageName: 'com.radioStation.app',
        ),
        MarkerLayer(
          markers: radioStations
              .map((e) => Marker(
                    point: LatLng(e.geoLat!, e.geoLong!),
                    width: 35,
                    height: 35,
                    builder: (context) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<RadioStationPlayerCubit>(
                                  create: (context) =>
                                      RadioStationPlayerCubit(),
                                  child: RadioStationPlayerView(
                                    radioStation: radioStations.firstWhere(
                                        (element) =>
                                            element.geoLat == e.geoLat &&
                                            element.geoLong == e.geoLong),
                                  ),
                                )));
                      },
                      child: const RiveAnimation.asset(
                        "assets/animations/marker.riv",
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
