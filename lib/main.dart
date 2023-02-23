import 'package:flutter/material.dart';
import 'package:mini_projects/pages/destini.dart';
import 'package:mini_projects/pages/home.dart';
import 'package:mini_projects/pages/i_am_rich.dart';
import 'package:mini_projects/pages/dicee.dart';
import 'package:mini_projects/pages/magic_ball.dart';
import 'package:mini_projects/pages/quizzler.dart';
import 'package:mini_projects/pages/xylophone.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomePage(),
      '/i_am_rich': (context) => IAmRichPage(),
      '/dicee': (context) => DiceePage(),
      '/magic_ball': (context) => MagicBallPage(),
      '/xylophone': (context) => XylophonePage(),
      '/quizzler': (context) => QuizzlerPage(),
      '/destini': (context) => DestiniPage(),
    },
  ));
}
