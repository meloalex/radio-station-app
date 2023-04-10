import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/models/radio_station.dart';
import 'package:radio_station/radio_station_player/cubit/radio_station_player_cubit.dart';
import 'package:radio_station/radio_station_player/view/radio_station_player_view.dart';

class RadioStationsList extends StatelessWidget {
  final List<RadioStation> radioStations;

  const RadioStationsList({super.key, required this.radioStations});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: radioStations.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) => ListTile(
          trailing: Icon(Icons.play_arrow),
          title: Text(radioStations[index].name),
          subtitle: Text(radioStations[index].country),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider<RadioStationPlayerCubit>(
                create: (context) => RadioStationPlayerCubit(),
                child: RadioStationPlayerView(
                  radioStation: radioStations[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
