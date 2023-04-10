import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/core/widgets/loader.dart';
import 'package:radio_station/models/radio_station.dart';
import 'package:radio_station/radio_station_player/cubit/radio_station_player_cubit.dart';
import 'package:radio_station/radio_station_player/widgets/error.dart';
import 'package:radio_station/radio_station_player/widgets/music_player.dart';
import 'package:rive/rive.dart';

class RadioStationPlayerView extends StatefulWidget {
  final RadioStation radioStation;

  const RadioStationPlayerView({super.key, required this.radioStation});

  @override
  State<RadioStationPlayerView> createState() => _RadioStationPlayerViewState();
}

class _RadioStationPlayerViewState extends State<RadioStationPlayerView> {
  SMIBool? _play;
  late RiveAnimationController _controller;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _play = controller.findInput<bool>('Play') as SMIBool;
    _play?.change(true);
  }

  @override
  void initState() {
    super.initState();

    _controller = SimpleAnimation('Timeline 1');

    BlocProvider.of<RadioStationPlayerCubit>(context)
        .play(widget.radioStation.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RadioStationPlayerCubit, RadioStationPlayerState>(
        listener: (context, state) {
          if (state is RadioStationPlayerPlaying) {
            _play?.change(true);
            _controller.isActive = true;
          }

          if (state is RadioStationPlayerPaused) {
            _play?.change(false);
            _controller.isActive = false;
          }
        },
        builder: (context, state) {
          if (state is RadioStationPlayerLoading) {
            return _loading();
          }

          if (state is RadioStationPlayerPlaying ||
              state is RadioStationPlayerPaused) {
            return MusicPlayer(
              radioStation: widget.radioStation,
              onRiveInit: _onRiveInit,
              controller: _controller,
            );
          }

          if (state is RadioStationPlayerError) {
            return const RadioPlayerError();
          }

          return const Center(
            child: Text("Something went wrong, please try again later."),
          );
        },
      ),
    );
  }

  Widget _loading() {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
        ),
        const GenericLoader(),
      ],
    );
  }
}
