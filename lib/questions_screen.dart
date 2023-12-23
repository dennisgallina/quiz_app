import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  // This widget displays a question and its corresponding answer buttons

  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer, // Function to handle user's answer selection
  });

  final void Function(String answer)
      onSelectAnswer; // Function to handle user's answer selection

  @override
  State<QuestionsScreen> createState() => _QuestionsScreen();
}

class _QuestionsScreen extends State<QuestionsScreen> {
  // Current question index (used to track the current question being displayed)
  var currentQuestionIndex = 0;

  // Method to handle user's answer selection
  void answerQuestion(String selectedAnswer) {
    // Call the callback provided in the constructor to update the selected answer
    widget.onSelectAnswer(selectedAnswer);

    // Increment the current question index to move to the next question
    setState(() {
      currentQuestionIndex++;
    });
  }

  // Builds the widget for the QuestionsScreen
  @override
  Widget build(BuildContext context) {
    // Retrieves the current question based on the current index
    final currentQuestion = questions[currentQuestionIndex];

    // Creates a SizedBox that fills the available width
    return SizedBox(
      width: double.infinity, // Set the width to double.infinity
      child: Container(
        // Wrap the question and answer buttons in a Container
        margin: const EdgeInsets.all(
            40), // Add a margin of 40 pixels around the widget
        child: Column(
          // Create a Column layout for the question and answer buttons
          mainAxisAlignment: MainAxisAlignment
              .center, // Align children along the main axis (vertically)
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Align children within their respective containers (stretch)
          children: [
            // Display the current question
            Text(
              currentQuestion.question, // Set the question text
              style: GoogleFonts.lato(
                // Apply GoogleFonts.lato style
                color: const Color.fromARGB(
                    255, 201, 153, 251), // Set the question text color
                fontSize: 24, // Set the question text font size
                fontWeight: FontWeight
                    .bold, // Set the question text font weight to bold
              ),
              textAlign:
                  TextAlign.center, // Center the question text horizontally
            ),

            // Add a spacing of 30 pixels between the question and the answer buttons
            const SizedBox(height: 30),

            // Iterate through the current question's answers
            ...currentQuestion.getShuffledAnswers().map((answer) {
              // Create an AnswerButton widget for each answer
              return AnswerButton(
                // Set the answer text for the button
                answerText: answer, // Set the answer text for the button
                onTap: () {
                  // Call the answerQuestion method to handle the user's selection
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
