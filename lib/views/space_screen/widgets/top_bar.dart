import 'package:flutter/material.dart';
import 'package:gamified_space_screen/constants/colors.dart';

class SpaceScreenTopBar extends StatelessWidget {
  const SpaceScreenTopBar({Key? key}) : super(key: key);

  void tapEvent() {
    print("Top Bar pressed");
  }

  @override
  Widget build(BuildContext context) {
    final _usernameStyle = TextStyle(
      color: kThemeColorLight,
      fontSize: 17,
    );
    final _energyStyle = TextStyle(
      color: kThemeColorLight,
      fontSize: 15,
    );
    final _rankStyle = TextStyle(
      color: kRankColor,
      fontSize: 15,
    );

    final _size = MediaQuery.of(context).size;

    return SizedBox(
      width: _size.width,
      height: _size.width * .27,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: _size.width * .05,
            right: _size.width * .05,
            top: _size.width * .11,
            child: InkWell(
              onTap: tapEvent,
              child: Container(
                decoration: BoxDecoration(
                  color: kTopBarColorDarker.withOpacity(kTopBarOpacity),
                  borderRadius: BorderRadius.circular(80),
                ),
                width: _size.width * .9,
                height: _size.width * .15,
              ),
            ),
          ),
          Positioned(
            left: _size.width * .075,
            right: _size.width * .075,
            height: _size.width / 8,
            top: 0,
            child: Image.asset(
              'assets/images/top_bar_decoration.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            bottom: 0,
            left: _size.width * .1,
            height: _size.width * .16,
            width: _size.width * .16,
            child: InkWell(
              onTap: tapEvent,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile_background.png'),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/profile_avatar.png',
                      ),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/profile_frame.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: _size.width * .11,
            bottom: _size.width * .01,
            right: _size.width * .1,
            width: _size.width * .59,
            child: GestureDetector(
              onTap: tapEvent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Ernesto Gonzalez',
                              style: _usernameStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/images/ic_rank.png',
                                    width: _size.width * .05,
                                    height: _size.width * .05,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      'Tutor',
                                      style: _rankStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/energy_ic.png',
                            width: _size.width * .05,
                            height: _size.width * .05,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              '5/5',
                              style: _energyStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
