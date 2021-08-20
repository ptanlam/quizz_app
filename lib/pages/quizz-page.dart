import 'package:flutter/material.dart';
import 'package:quizz_app/components/quizz-button.dart';
import 'package:quizz_app/repositories/questions-repositories.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var questionsRepository = QuestionsRepository();

class QuizzPage extends StatefulWidget {
  QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> scoreKepper = [];

  bool checkAnswer(bool answer) {
    return questionsRepository.getAnswerForQuestion() == answer;
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
    setState(() {
      if (questionsRepository.isFinished()) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        return;
      }
      print('hi');

      var isCorrect = checkAnswer(answer);
      scoreKepper.add(getIcon(isCorrect));
      questionsRepository.nextQuestion();
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
                  questionsRepository.getQuestion(),
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
