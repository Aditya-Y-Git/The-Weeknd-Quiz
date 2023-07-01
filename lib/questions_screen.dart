import 'package:flutter/material.dart';
import 'package:xo/answer_button.dart';
import 'package:xo/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answerText) {
    widget.onSelectAnswer(answerText);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // double.infinity takes all the possible width
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 110,
            ),
            Text(
              currentQuestion.text,
              style: GoogleFonts.play(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),
            // using map and spread operator to access all the options in answer
            // accessing the options by shuffling them
            ...currentQuestion.getShuffledList().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
