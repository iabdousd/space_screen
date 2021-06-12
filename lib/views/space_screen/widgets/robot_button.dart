import 'package:flutter/material.dart';

class RobotButton extends StatelessWidget {
  const RobotButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => print("Robot button pressed"),
        child: Image.asset(
          'assets/images/robot_btn.png',
          width: size.width * .175,
          height: size.width * .175,
        ),
      ),
    );
  }
}
