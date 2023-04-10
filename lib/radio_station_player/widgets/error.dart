import 'package:flutter/material.dart';
import 'package:radio_station/radio_station_player/widgets/player_back_button.dart';
import 'package:rive/rive.dart';

class RadioPlayerError extends StatelessWidget {
  const RadioPlayerError({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Error\n\n coudn't load the stream",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 400,
                height: 400,
                child: RiveAnimation.asset(
                  "assets/animations/error.riv",
                ),
              ),
            ],
          ),
        ),
        const PlayerBackButton(),
      ],
    );
  }
}
