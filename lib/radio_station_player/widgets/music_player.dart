import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/models/radio_station.dart';
import 'package:radio_station/radio_station_player/cubit/radio_station_player_cubit.dart';
import 'package:radio_station/radio_station_player/widgets/player_back_button.dart';
import 'package:rive/rive.dart';

class MusicPlayer extends StatefulWidget {
  final RadioStation radioStation;
  final Function(Artboard) onRiveInit;
  final RiveAnimationController controller;

  const MusicPlayer({
    super.key,
    required this.radioStation,
    required this.onRiveInit,
    required this.controller,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  void _togglePlay() {
    BlocProvider.of<RadioStationPlayerCubit>(context).togglePlay();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RiveAnimation.asset(
          "assets/animations/cassettine.riv",
          controllers: [widget.controller],
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _togglePlay,
                    child: RiveAnimation.asset(
                      "assets/animations/play_button_black.riv",
                      onInit: widget.onRiveInit,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.radioStation.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.radioStation.country,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.radioStation.tags,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const PlayerBackButton(),
      ],
    );
  }
}
