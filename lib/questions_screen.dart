import 'package:flutter/material.dart';
import 'package:xo/answer_button.dart';
import 'package:xo/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  final currentQuestion = questions[0];

  @override
  Widget build(context) {
    return SizedBox(
      // double.infinity takes all the possible width
      width: double.infinity,
      child: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 125,
            ),
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            // using map and spread operator to access all the options in answer
            const SizedBox(height: 20),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(answerText: answer, onTap: () {});
            }),
          ],
        ),
      ),
    );
  }
}
