import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mini_projects/constants/colors.dart';

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('Xylophone/note$soundNumber.wav'));
  }

  Expanded buildKey({required Color reqdColor, required int soundNumber}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // setState() {reqdColor = reqdColor.withOpacity(10);}
          playSound(soundNumber);
        },
        child: Container(
          color: reqdColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Xylophone'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          buildKey(reqdColor: Colors.red, soundNumber: 1),
          buildKey(reqdColor: Colors.orange, soundNumber: 2),
          buildKey(reqdColor: Colors.yellow, soundNumber: 3),
          buildKey(reqdColor: Colors.green, soundNumber: 4),
          buildKey(reqdColor: Colors.blue, soundNumber: 5),
          buildKey(reqdColor: Colors.indigo, soundNumber: 6),
          buildKey(reqdColor: Colors.purple, soundNumber: 7),
        ],
      )),
    );
  }
}
