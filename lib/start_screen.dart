import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/weeknd-1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 150,
          ),
          // here richtext is used to separately decorate the words in the string
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: "Let's check how huge fan of ",
                  style: GoogleFonts.play(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                TextSpan(
                  text: 'The Weeknd',
                  style: GoogleFonts.play(
                    color: const Color.fromARGB(255, 255, 149, 149),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' you are',
                  style: GoogleFonts.play(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: Text(
              "XOTWOD",
              style: GoogleFonts.play(
                fontSize: 18,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      )),
    );
  }
}
