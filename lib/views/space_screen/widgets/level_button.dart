import 'package:flutter/material.dart';
import 'package:gamified_space_screen/constants/colors.dart';
import 'package:gamified_space_screen/constants/enums.dart';

class LevelButton extends StatelessWidget {
  final String levelName;
  final LevelButtonState state;

  const LevelButton({
    Key? key,
    required this.levelName,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelStyle = TextStyle(
      color: kThemeColorLight,
      fontSize: state == LevelButtonState.active ? 17 : 13,
    );

    return Expanded(
      flex: state == LevelButtonState.active ? 3 : 2,
      child: InkWell(
        onTap: () => print('Level button pressed'),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                state == LevelButtonState.active
                    ? 'assets/images/level_btn_active.png'
                    : state == LevelButtonState.locked
                        ? 'assets/images/level_btn_locked.png'
                        : 'assets/images/level_btn_idle.png',
              ),
            ),
          ),
          // margin: EdgeInsets.all(4.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: Padding(
                padding: state == LevelButtonState.locked
                    ? EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * .0525,
                      )
                    : const EdgeInsets.all(8.0),
                child: Text(
                  levelName,
                  style: levelStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
