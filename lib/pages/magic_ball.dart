import 'package:flutter/material.dart';
import 'package:mini_projects/constants/colors.dart';
import 'dart:math';

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Magic Ball'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              ballNumber = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset(
            'images/MagicBall/ball$ballNumber.png',
          ),
        ),
      ),
    );
  }
}
