import 'package:flutter/material.dart';

import 'space_screen/space_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamified Space Screen',
      theme: ThemeData(
        fontFamily: 'Electrolize',
      ),
      home: SpaceScreen(),
    );
  }
}
