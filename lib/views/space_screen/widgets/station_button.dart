import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gamified_space_screen/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class StationButton extends StatelessWidget {
  final String stationName;
  final String stationImage;
  final bool selected;
  final int status;
  final VoidCallback handleClick;

  const StationButton({
    Key? key,
    required this.stationName,
    required this.stationImage,
    required this.status,
    required this.handleClick,
    this.selected: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final stationNameStyle = TextStyle(
      color: selected ? kStationColorDark : kThemeColorLight,
      fontSize: 17.0,
    );

    final stationLong = size.width / 4.75;

    return InkWell(
      onTap: handleClick,
      child: Stack(
        children: [
          if (stationName.isNotEmpty)
            Positioned(
              left: stationLong - 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: FadeIn(
                  key: Key(stationName + '_label'),
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    constraints: BoxConstraints(
                        // maxWidth: stationLong,
                        ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? kThemeColorLight.withOpacity(kStationLabelOpacity2)
                          : kStationColorDark
                              .withOpacity(kStationLabelOpacity1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      stationName[0].toUpperCase() +
                          stationName.substring(1, stationName.length),
                      style: stationNameStyle,
                    ),
                  ),
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  selected
                      ? 'assets/images/station_btn_selected.png'
                      : 'assets/images/station_btn_idle.png',
                ),
              ),
            ),
            height: stationLong,
            width: stationLong,
            margin: EdgeInsets.only(right: stationLong),
            child: Stack(
              children: [
                Center(
                  child: status == -1
                      ? Shimmer.fromColors(
                          child: Container(
                            width: stationLong / 2.125,
                            height: stationLong / 2.125,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          baseColor: kStationColorDark,
                          highlightColor: kTopBarColorDarker,
                        )
                      : FadeIn(
                          key: Key(stationName),
                          duration: Duration(milliseconds: 500),
                          child: Image.asset(
                            stationImage,
                            width: stationLong / 2.125,
                            height: stationLong / 2.125,
                          ),
                        ),
                ),
                if (status == 0)
                  Center(
                    child: FadeIn(
                      key: Key(stationName + '_'),
                      duration: Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/images/ic_lock.png',
                        width: stationLong / 6.375,
                        height: stationLong / 6.375,
                        alignment: Alignment.center,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
