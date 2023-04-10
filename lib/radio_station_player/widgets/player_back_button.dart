import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/radio_station_player/cubit/radio_station_player_cubit.dart';

class PlayerBackButton extends StatelessWidget {
  const PlayerBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
            ),
            onPressed: () {
              BlocProvider.of<RadioStationPlayerCubit>(context).pause();
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
