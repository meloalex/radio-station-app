part of 'radio_station_player_cubit.dart';

abstract class RadioStationPlayerState extends Equatable {
  const RadioStationPlayerState();

  @override
  List<Object> get props => [];
}

class RadioStationPlayerLoading extends RadioStationPlayerState {
  const RadioStationPlayerLoading();

  @override
  String toString() => "RadioStationPlayerLoading { }";
}

class RadioStationPlayerPlaying extends RadioStationPlayerState {
  const RadioStationPlayerPlaying();

  @override
  String toString() => "RadioStationPlayerPlaying { }";
}

class RadioStationPlayerPaused extends RadioStationPlayerState {
  const RadioStationPlayerPaused();

  @override
  String toString() => "RadioStationPlayerPaused { }";
}

class RadioStationPlayerError extends RadioStationPlayerState {
  final String error;

  const RadioStationPlayerError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "RadioStationPlayerError { error: $error }";
}
