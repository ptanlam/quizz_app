import 'package:quizz_app/models/question.dart';

class QuestionsRepository {
  int _questionNumber = 0;

  List<Question> _questions = [
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
    Question(
      question: 'Lionel Messi is playing for Paris Saint Germain',
      answer: true,
    ),
  ];

  bool isFinished() {
    return _questionNumber >= _questions.length - 1;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) _questionNumber++;
  }

  String getQuestion() {
    return _questions[_questionNumber].question;
  }

  bool getAnswerForQuestion() {
    return _questions[_questionNumber].answer;
  }
}
