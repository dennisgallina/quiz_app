import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Sets the width to double.infinity
      width: double.infinity,
      // Wraps the question and answer buttons in a Container
      child: Container(
        // Adds a margin of 40 pixels around the widget
        margin: const EdgeInsets.all(40),
        child: Column(
          // Aligns the children along the main axis (vertically)
          mainAxisAlignment: MainAxisAlignment.center,
          // Aligns the children within their respective containers (stretch)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 30),
            const Text('List of answers and questions...'),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
