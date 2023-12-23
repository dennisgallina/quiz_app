import 'package:flutter/material.dart';

// This widget creates an elevated button for selecting an answer option
class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText, // The text displayed on the button
    required this.onTap, // The callback function triggered when the button is tapped
  });

  final String answerText; // Text displayed on the button
  final void Function()
      onTap; // Callback function triggered when the button is tapped

  @override
  Widget build(BuildContext context) {
    // Create an elevated button with raised style
    return ElevatedButton(
      onPressed: onTap, // Set the onPressed callback
      style: ElevatedButton.styleFrom(
        // Apply padding and set button background color
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(
            255, 33, 1, 95), // Set the background color to a dark blue
        // Set button foreground color (text color)
        foregroundColor: Colors.white, // Set the text color to white
      ),

      // Display the answer text on the button
      child: Text(
        answerText, // Set the button text to the provided answer text
        textAlign:
            TextAlign.center, // Center the text horizontally within the button
      ),
    );
  }
}
