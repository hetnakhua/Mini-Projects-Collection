import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:mini_projects/models/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({super.key});

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  QuizBrain quizBrain = new QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(context: context, title: "FINISHED", desc: "End of Quiz").show();
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        scoreKeeper.add((quizBrain.getQuestionAnswer() == userPickedAnswer)
            ? Icon(
                Icons.check,
                color: Colors.green.shade300,
              )
            : Icon(
                Icons.close,
                color: Colors.red.shade300,
              ));
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Quizzler'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),

          // True button
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade300,
                  foregroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          // False button
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: OutlinedButton(
                onPressed: () {
                  checkAnswer(false);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade300,
                  side: BorderSide(width: 3, color: Colors.red.shade300),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          // Displaying number of correct or wrong answers
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}
