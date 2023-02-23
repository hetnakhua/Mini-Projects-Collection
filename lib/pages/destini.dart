import 'package:flutter/material.dart';
import 'package:mini_projects/constants/colors.dart';
import 'package:mini_projects/models/story_brain.dart';

class DestiniPage extends StatefulWidget {
  const DestiniPage({super.key});

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  StoryBrain storyBrain = new StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Destini'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Destini/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text for the story
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),

              // Option 1 to continue
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: gradColor1,
                      // foregroundColor: gradColor1.withOpacity(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: 16),

              // Option 2 to continue
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: gradColor2,
                        // foregroundColor: gradColor2.withOpacity(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
