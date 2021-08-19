import 'package:flutter/material.dart';
import 'package:quizz_app/pages/quizz-page.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}
