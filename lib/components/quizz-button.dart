import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final Color color;
  final bool answer;

  final Function onAnswerPressed;

  const AnswerButton({
    Key? key,
    required this.label,
    required this.color,
    required this.answer,
    required this.onAnswerPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      onPressed: () {
        onAnswerPressed(answer);
      },
      child: SizedBox(
        width: double.infinity,
        height: 80.0,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
