import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(data['question_index'].toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'].toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['user_answer'].toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['correct_answer'].toString()),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
