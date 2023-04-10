import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/core/widgets/bloc_observer.dart';
import 'package:radio_station/home/cubit/radio_list_cubit.dart';
import 'package:radio_station/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Station App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider<RadioStationListCubit>(
        create: (context) => RadioStationListCubit()..loadRadioStations(),
        child: HomeView(),
      ),
    );
  }
}
