import 'package:flutter/material.dart';
import 'package:quiz/styled_text.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

// This class defines the QuestionsScreen widget, which displays a question
// and its corresponding answer buttons
class QuestionsScreen extends StatefulWidget {
  /// Creates an instance of QuestionsScreen.
  const QuestionsScreen({super.key});

  // Creates the state for this widget
  @override
  State<QuestionsScreen> createState() => _QuestionsScreen();
}

// This class manages the state of the QuestionsScreen widget
class _QuestionsScreen extends State<QuestionsScreen> {
  // The current question being displayed
  final currentQuestion = questions[0];

  // Builds the widget for the QuestionsScreen
  @override
  Widget build(BuildContext context) {
    // Returns a SizedBox that fills the available width
    return SizedBox(
      // Sets the width to double.infinity
      width: double.infinity,
      // Wraps the question and answer buttons in a Column
      child: Column(
        // Aligns the children along the main axis (vertically)
        mainAxisAlignment: MainAxisAlignment.center,
        // Displays the current question
        children: [
          StyledText(currentQuestion.question, 14, Colors.white),
          // Adds a spacing of 30 pixels
          const SizedBox(height: 30),
          // Iterates through the current question's answers
          ...currentQuestion.answers.map((answer) {
            // Creates an AnswerButton widget for each answer
            return AnswerButton(
              answerText: answer,
              onTap: () {},
            );
          }),
        ],
      ),
    );
  }
}
