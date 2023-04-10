import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/core/widgets/loader.dart';
import 'package:radio_station/home/cubit/radio_list_cubit.dart';
import 'package:radio_station/home/widgets/radio_stations_list.dart';
import 'package:radio_station/home/widgets/radio_stations_map_list.dart';
import 'package:rive/rive.dart';

class HomeView extends StatelessWidget {
  late SMIBool? _toggle;
  HomeView({super.key});

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'Simple SM');
    artboard.addController(controller!);
    _toggle = controller.findInput<bool>('Toggle') as SMIBool;
    _toggle?.change(false);
  }

  void _toggleSwitch(BuildContext context) {
    _toggle?.change(!_toggle!.value);
    BlocProvider.of<RadioStationListCubit>(context).toggleView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/background.png"),
          BlocBuilder<RadioStationListCubit, RadioStationListState>(
            builder: (context, state) {
              if (state is RadioStationListLoading) {
                return const GenericLoader();
              }

              if (state is RadioStationList) {
                return RadioStationsList(radioStations: state.radioStations);
              }

              if (state is RadioStationMap) {
                return RadioStationMapList(radioStations: state.radioStations);
              }

              return const Center(
                child: Text("Something went wrong, please try again later."),
              );
            },
          ),
          GestureDetector(
            onTap: () => _toggleSwitch(context),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 150,
                height: 150,
                child: RiveAnimation.asset(
                  "assets/animations/switch.riv",
                  onInit: _onRiveInit,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
