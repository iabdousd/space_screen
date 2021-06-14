import 'package:flutter/material.dart';
import 'package:gamified_space_screen/models/station_model.dart';

import 'station_button.dart';

class SpaceMap extends StatelessWidget {
  final bool loading;
  final List<StationModel> stations;
  final Function(StationModel) selectStation;
  final Function(StationModel) isStationSelected;
  final VoidCallback cancelSelectStation;
  const SpaceMap({
    Key? key,
    required this.loading,
    required this.stations,
    required this.selectStation,
    required this.isStationSelected,
    required this.cancelSelectStation,
  }) : super(key: key);

  StationModel getStation(int index) {
    if (loading) {
      // ! The status -1 is for loading state
      return StationModel(
        name: '',
        imageName: 'loading',
        imageType: 'png',
        status: -1,
      );
    }
    if (index >= stations.length)
      return StationModel(
        name: '???',
        imageName: 'station_moon',
        imageType: 'png',
        status: 0,
      );

    return stations[index];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final stationLong = size.width / 4.75;

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: .2 * constraints.maxWidth,
            child: Container(
              width: size.width * 1.26,
              height: size.width * 1.26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/radar_shadow.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: .33 * constraints.maxWidth,
            child: Container(
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/radar_foreground.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          // ---------- STATIONS ----------

          // STATION #1
          Positioned(
            top: constraints.maxHeight / 2 -
                stationLong / 2 -
                .03 * size.width -
                stationLong -
                .735 * stationLong,
            left: .66 * size.width -
                stationLong / 2 -
                .27 * stationLong -
                .748 * stationLong,
            child: StationButton(
              stationName: getStation(0).name,
              stationImage:
                  'assets/images/${getStation(0).imageName}_${getStation(0).status == 0 ? 'locked' : 'active'}.${getStation(0).imageType}',
              status: getStation(0).status,
              selected: isStationSelected(getStation(0)),
              handleClick: () => selectStation(getStation(0)),
              cancelSelectStation: cancelSelectStation,
            ),
          ),

          // STATION #2
          Positioned(
            top: constraints.maxHeight / 2 -
                stationLong / 2 -
                .0065 * size.width -
                stationLong,
            left: .66 * size.width - stationLong / 2 - .27 * stationLong,
            child: StationButton(
              stationName: getStation(1).name,
              stationImage:
                  'assets/images/${getStation(1).imageName}_${getStation(1).status == 0 ? 'locked' : 'active'}.${getStation(1).imageType}',
              status: getStation(1).status,
              selected: isStationSelected(getStation(1)),
              handleClick: () => selectStation(getStation(1)),
              cancelSelectStation: cancelSelectStation,
            ),
          ),

          // STATION #3
          Positioned(
            top: constraints.maxHeight / 2 - stationLong / 2,
            left: .66 * size.width - stationLong / 2,
            child: StationButton(
              stationName: getStation(2).name,
              stationImage:
                  'assets/images/${getStation(2).imageName}_${getStation(2).status == 0 ? 'locked' : 'active'}.${getStation(2).imageType}',
              status: getStation(2).status,
              selected: isStationSelected(getStation(2)),
              handleClick: () => selectStation(getStation(2)),
              cancelSelectStation: cancelSelectStation,
            ),
          ),

          // STATION #4
          Positioned(
            top: constraints.maxHeight / 2 -
                stationLong / 2 +
                .0065 * size.width +
                stationLong,
            left: .66 * size.width - stationLong / 2 - .27 * stationLong,
            child: StationButton(
              stationName: getStation(3).name,
              stationImage:
                  'assets/images/${getStation(3).imageName}_${getStation(3).status == 0 ? 'locked' : 'active'}.${getStation(3).imageType}',
              status: getStation(3).status,
              selected: isStationSelected(getStation(3)),
              handleClick: () => selectStation(getStation(3)),
              cancelSelectStation: cancelSelectStation,
            ),
          ),

          // STATION #5
          Positioned(
            top: constraints.maxHeight / 2 -
                stationLong / 2 +
                .03 * size.width +
                stationLong +
                .735 * stationLong,
            left: .66 * size.width -
                stationLong / 2 -
                .27 * stationLong -
                .748 * stationLong,
            child: StationButton(
              stationName: getStation(4).name,
              stationImage:
                  'assets/images/${getStation(4).imageName}_${getStation(4).status == 0 ? 'locked' : 'active'}.${getStation(4).imageType}',
              status: getStation(4).status,
              selected: isStationSelected(getStation(4)),
              handleClick: () => selectStation(getStation(4)),
              cancelSelectStation: cancelSelectStation,
            ),
          ),
        ],
      );
    });
  }
}
