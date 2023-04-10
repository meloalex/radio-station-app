import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:radio_station/home/radio_station_repository.dart';
import 'package:radio_station/models/radio_station.dart';

part 'radio_list_state.dart';

class RadioStationListCubit extends Cubit<RadioStationListState> {
  final RadioStationRepository _radioStationRepository =
      RadioStationRepository();

  bool listViewActive = true;

  RadioStationListCubit() : super(const RadioStationListLoading());

  Future<void> loadRadioStations() async {
    emit(const RadioStationListLoading());

    final radioStations = await _radioStationRepository.getStations();

    emit(RadioStationList(stations: radioStations));
  }

  void toggleView() {
    if (listViewActive) {
      emit(RadioStationMap(stations: state.radioStations));
    } else {
      emit(RadioStationList(stations: state.radioStations));
    }

    listViewActive = !listViewActive;
  }
}
