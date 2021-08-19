import 'package:flutter/material.dart';
import 'package:quizz_app/components/quizz-button.dart';

import '../question.dart';

class QuizzPage extends StatefulWidget {
  QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> scoreKepper = [];

  List<Question> questions = [
    Question(
      question: 'Cristiano Ronaldo is playing for Manchester Uniter',
      answer: false,
    ),
    Question(
      question: 'United States of America has 51 states',
      answer: false,
    ),
    Question(
      question: 'A slug\'s blood os green',
      answer: true,
    ),
  ];

  var questionNumber = 0;

  bool checkAnswer(bool answer) {
    return questions[questionNumber].answer == answer;
  }

  Icon getIcon(bool isCorrect) {
    return isCorrect
        ? Icon(
            Icons.check,
            color: Colors.green,
          )
        : Icon(
            Icons.close,
            color: Colors.red,
          );
  }

  void onAnswerPressed(bool answer) {
    var isCorrect = checkAnswer(answer);

    setState(() {
      scoreKepper.add(getIcon(isCorrect));
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  questions[questionNumber].question,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnswerButton(
                  label: 'True',
                  color: Colors.green,
                  answer: true,
                  onAnswerPressed: onAnswerPressed,
                ),
                SizedBox(
                  height: 20.0,
                ),
                AnswerButton(
                  label: 'False',
                  color: Colors.red,
                  answer: false,
                  onAnswerPressed: onAnswerPressed,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: scoreKepper,
          ),
        ],
      ),
    );
  }
}

/**
 * 'Cristiano Ronaldo is playing for Manchester Uniter', false
 * 'United States of America has 51 states', false
 * 'A slug\'s blood os green', true
 */
