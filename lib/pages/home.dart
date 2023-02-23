import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_projects/constants/colors.dart';
import 'package:mini_projects/models/project.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Project> projects = [
    Project(project_name: 'I Am Rich', project_route: '/i_am_rich'),
    Project(project_name: 'Dicee', project_route: '/dicee'),
    Project(project_name: 'Magic Ball', project_route: '/magic_ball'),
    Project(project_name: 'Xylophone', project_route: '/xylophone'),
    Project(project_name: 'Quizzler', project_route: '/quizzler'),
    Project(project_name: 'Destini', project_route: '/destini'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Het\'s Mini Projects',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: bgColor,
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '${projects[index].project_route}');
              },
              child: Container(
                child: Align(
                  child: Text(
                    '${projects[index].project_name}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [gradColor1, gradColor2],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
