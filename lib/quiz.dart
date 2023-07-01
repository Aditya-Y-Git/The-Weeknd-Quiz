import 'package:flutter/material.dart';
import 'package:xo/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weeknd.jpg'),
              fit: BoxFit.cover,
              opacity: 10,
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    );
  }
}