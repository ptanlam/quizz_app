import 'package:flutter/material.dart';
import 'package:quizz_app/components/quizz-button.dart';

class QuizzPage extends StatefulWidget {
  QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
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
                  'This is where the question text will go.',
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
                ),
                SizedBox(
                  height: 20.0,
                ),
                AnswerButton(
                  label: 'False',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
