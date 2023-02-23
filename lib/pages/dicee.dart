import 'package:flutter/material.dart';
import 'package:mini_projects/constants/colors.dart';
import 'dart:math';

class DiceePage extends StatefulWidget {
  const DiceePage({super.key});

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1, rightDiceNumber = 1;

  void changeDiceFace() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Dicee'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeDiceFace();
                  });
                },
                child: Image.asset(
                  'images/Dicee/dice$leftDiceNumber.png',
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeDiceFace();
                  });
                },
                child: Image.asset(
                  'images/Dicee/dice$rightDiceNumber.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
