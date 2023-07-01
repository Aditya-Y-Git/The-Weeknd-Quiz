import 'package:flutter/material.dart';
import 'package:xo/data/questions.dart';
import 'package:xo/questions_screen.dart';
import 'package:xo/result_screen.dart';
import 'package:xo/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // selectedAnswers is the list of answers selected by user and initially it is empty
  // the reason for storing selectedAnswers in the this widget is that this widget is
  // controlling the questions screen and the result screnn and we need to collect answers
  // from questions screen and show them on result screen
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // chooseAnswer method will receive the answer selected by user and add it to the list
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // switchScreen() function helps to switch between the screens and it should be executed
    // when the button on the start screen is pressed. So we need to pass this function to
    // the start screen widget
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(restartQuiz, chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weeknd-4.jpg'),
              fit: BoxFit.cover,
              // opacity: 20,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
