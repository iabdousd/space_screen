import 'package:flutter/material.dart';
import 'package:gamified_space_screen/constants/enums.dart';

import 'level_button.dart';

class LevelButtonList extends StatelessWidget {
  const LevelButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/levels_background_shadow.png',
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * .125),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/levels_background_left.png',
              width: size.width * .15,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/levels_background_right.png',
              width: size.width * .15,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: Row(
              children: [
                LevelButton(
                  levelName: 'CORE SKILLS',
                  state: LevelButtonState.active,
                ),
                Image.asset(
                  'assets/images/levels_background_center.png',
                  width: size.width * .025,
                ),
                LevelButton(
                  levelName: 'TAAP',
                  state: LevelButtonState.idle,
                ),
                Image.asset(
                  'assets/images/levels_background_center.png',
                  width: size.width * .025,
                ),
                LevelButton(
                  levelName: 'TOP LEADER',
                  state: LevelButtonState.locked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
