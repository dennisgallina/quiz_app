import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // Constructor that takes a function as parameter
  const StartScreen(this.startQuiz, {super.key});

  // The function to be called when the Start Quiz button is tapped
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    // Creates a Center layout with minimum main axis size
    return Center(
      child: Column(
        // Sets the main axis size to minimum
        mainAxisSize: MainAxisSize.min,
        // Aligns the children vertically
        children: [
          // Displays the quiz logo image
          Image.asset(
            'assets/images/quiz-logo.png',
            // Sets the width to 300 pixels
            width: 300,
            // Tints the logo with a semi-transparent white color
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Adds a spacing of 80 pixels
          const SizedBox(height: 80),
          // Displays a heading text with the title "Learn Flutter the fun way!"
          Text(
            'Learn Flutter the fun way!',
            // Sets the text style using GoogleFonts.lato
            style: GoogleFonts.lato(
              // Sets the text color to a light blue color
              color: const Color.fromARGB(255, 201, 153, 251),
              // Sets the font size to 24 pixels
              fontSize: 24,
              // Sets the font weight to bold
              fontWeight: FontWeight.bold,
            ),
            // Sets the text alignment to center
            textAlign: TextAlign.center,
          ),
          // Adds a spacing of 40 pixels
          const SizedBox(height: 40),
          // Creates an OutlinedButton with an icon and text for starting the quiz
          OutlinedButton.icon(
            // Triggers the startQuiz function when tapped
            onPressed: startQuiz,
            // Sets the button style to use white text and a transparent background
            style: OutlinedButton.styleFrom(
              // Sets the foreground color (text color) to white
              foregroundColor: Colors.white,
            ),
            // Sets the icon to an arrow pointing right (Icons.arrow_right)
            icon: const Icon(Icons.arrow_right),
            // Sets the label text to "Start Quiz"
            label: const Text(
              'Start Quiz',
              // Sets the text style with font size 14 and white color
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
