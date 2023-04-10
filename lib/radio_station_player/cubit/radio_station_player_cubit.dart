import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'radio_station_player_state.dart';

class RadioStationPlayerCubit extends Cubit<RadioStationPlayerState> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;

  RadioStationPlayerCubit() : super(const RadioStationPlayerLoading());

  Future<void> play(String url) async {
    emit(const RadioStationPlayerLoading());

    try {
      await assetsAudioPlayer.open(
        Audio.liveStream(url),
      );

      isPlaying = true;
      emit(const RadioStationPlayerPlaying());
    } catch (e) {
      emit(RadioStationPlayerError(error: e.toString()));
    }
  }

  Future<void> togglePlay() async {
    if (isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  Future<void> pause() async {
    assetsAudioPlayer.pause();
    isPlaying = false;
    return emit(const RadioStationPlayerPaused());
  }

  Future<void> resume() async {
    assetsAudioPlayer.play();
    isPlaying = true;
    return emit(const RadioStationPlayerPlaying());
  }
}
