import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamified_space_screen/constants/api_config.dart';
import 'package:http/http.dart' as http;

import 'package:gamified_space_screen/models/station_model.dart';

import 'widgets/level_button_list.dart';
import 'widgets/robot_button.dart';
import 'widgets/space_map.dart';
import 'widgets/top_bar.dart';

class SpaceScreen extends StatefulWidget {
  SpaceScreen({Key? key}) : super(key: key);

  @override
  _SpaceScreenState createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> {
  bool hasError = false;
  bool loading = true;
  List<StationModel> stations = [];

  String? selectedStationName;

  // Function to fetch the stations from API
  _init() async {
    final res = await http.get(
      Uri.parse(kFetchStationsEndPoint),
    );
    if (res.statusCode < 300 && res.statusCode > 199) {
      Map stationsRaw = json.decode(utf8.decode(res.bodyBytes));
      setState(() {
        stations =
            stationsRaw.values.map((e) => StationModel.fromMap(e)).toList();
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
        hasError = true;
      });
    }
  }

  void selectStation(StationModel station) {
    if (station.status == 1) {
      print("${station.name} pressed");
      setState(
        () => selectedStationName == station.name
            ? selectedStationName = null
            : selectedStationName = station.name,
      );
    }
  }

  bool isStationSelected(StationModel station) =>
      selectedStationName == station.name;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple,
      statusBarBrightness: Brightness.dark,
    ));
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpaceScreenTopBar(),
              Expanded(
                child: SpaceMap(
                  loading: loading,
                  stations: stations,
                  selectStation: selectStation,
                  isStationSelected: isStationSelected,
                ),
              ),
              LevelButtonList(),
              RobotButton(),
            ],
          ),
        ),
      ),
    );
  }
}
