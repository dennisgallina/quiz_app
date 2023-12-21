import 'package:flutter/material.dart';
import 'package:quiz/styled_text.dart';

class StartScreen extends StatelessWidget {
  // Constructor that accept parameters like a function
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 80),
        const StyledText('Learn Flutter the fun way!', 24, Colors.white),
        const SizedBox(height: 40),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right),
            label: const StyledText('Start Quiz', 14, Colors.white)),
      ],
    );
  }
}
