part of 'radio_list_cubit.dart';

abstract class RadioStationListState extends Equatable {
  final List<RadioStation> radioStations;

  const RadioStationListState({this.radioStations = const []});

  @override
  List<Object> get props => [radioStations];
}

class RadioStationListLoading extends RadioStationListState {
  const RadioStationListLoading();

  @override
  List<Object> get props => [];

  @override
  String toString() => "RadioStationListLoading { }";
}

class RadioStationList extends RadioStationListState {
  const RadioStationList({required List<RadioStation> stations})
      : super(radioStations: stations);

  @override
  List<Object> get props => [radioStations];

  @override
  String toString() =>
      "RadioStationListLoaded { radioStations: $radioStations }";
}

class RadioStationMap extends RadioStationListState {
  const RadioStationMap({required List<RadioStation> stations})
      : super(radioStations: stations);

  @override
  List<Object> get props => [radioStations];

  @override
  String toString() => "RadioStationMap { radioStations: $radioStations }";
}
