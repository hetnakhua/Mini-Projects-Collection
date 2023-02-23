import 'package:flutter/material.dart';
import 'package:mini_projects/constants/colors.dart';


class IAmRichPage extends StatelessWidget {
  const IAmRichPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'I Am Rich',
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: bgColor,
      ),
      body: Center(
        child: Image(image: AssetImage('images/iAmRich/diamond.png')),
      ),
    );
  }
}