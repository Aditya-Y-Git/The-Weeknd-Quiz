import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 125,
          ),
          const Text(
            "what is the real name of The Weeknd?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
        ],
      ),
    );
  }
}
