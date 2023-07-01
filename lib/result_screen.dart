import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo/data/questions.dart';
import 'package:xo/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz,
      {super.key, required this.chosenAnswers});

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    var summaryData = getSummaryData();
    var correctAnswers = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;
    final totalQuestion = chosenAnswers.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctAnswers out of $totalQuestion questions correctly",
              style: GoogleFonts.play(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(Icons.restart_alt),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 187, 31, 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                label: const Text("Restart Quiz!")),
          ],
        ),
      ),
    );
  }
}
