import 'package:flutter/material.dart';

// This widget identifies the question number and indicates whether it is
// a correct answer
class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  final int questionIndex; // The index of the question
  final bool
      isCorrectAnswer; // Whether the user's answer for this question is correct

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1; // Get the question number

    // Create a container for the question identifier
    return Container(
      width: 30, // Set the width to 30 pixels
      height: 30, // Set the height to 30 pixels
      alignment:
          Alignment.center, // Align the text to the center of the container
      decoration: BoxDecoration(
        // Apply a box decoration to the container
        color: isCorrectAnswer // Set the color based on the answer
            ? const Color.fromARGB(
                255, 150, 198, 241) // Green for correct answer
            : const Color.fromARGB(
                255, 249, 133, 241), // Red for incorrect answer
        borderRadius: BorderRadius.circular(
            100), // Set a circular border radius with a radius of 100 pixels
      ),
      child: Text(
        // Add a text widget to display the question number
        questionNumber.toString(), // Display the question number
        style: const TextStyle(
          // Apply a text style to the text widget
          fontWeight: FontWeight.bold, // Set a bold font weight
          color: Color.fromARGB(255, 22, 2, 56), // Set a dark gray color
        ),
      ),
    );
  }
}
