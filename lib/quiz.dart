import 'package:flutter/material.dart';
import 'package:xo/questions_screen.dart';
import 'package:xo/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  // switchScreen() function helps to switch between the screens and it should be executed
  // when the button on the start screen is pressed. So we need to pass this function to
  // the start screen widget
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
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
