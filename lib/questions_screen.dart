import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

// The QuestionsScreen class defines a widget that displays a question
// and its corresponding answer buttons
class QuestionsScreen extends StatefulWidget {
  // Constructor for the QuestionsScreen widget
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  // Creates the state for the QuestionsScreen widget
  @override
  State<QuestionsScreen> createState() => _QuestionsScreen();
}

// The _QuestionsScreen class manages the state of the QuestionsScreen widget
class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  // Builds the widget for the QuestionsScreen
  @override
  Widget build(BuildContext context) {
    // Stores the current question being displayed
    final currentQuestion = questions[currentQuestionIndex];
    // Returns a SizedBox that fills the available width
    return SizedBox(
      // Sets the width to double.infinity
      width: double.infinity,
      // Wraps the question and answer buttons in a Container
      child: Container(
        // Adds a margin of 40 pixels around the widget
        margin: const EdgeInsets.all(40),
        // Creates a Column layout for the question and answer buttons
        child: Column(
          // Aligns the children along the main axis (vertically)
          mainAxisAlignment: MainAxisAlignment.center,
          // Aligns the children within their respective containers (stretch)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Displays the current question
          children: [
            // Creates a Text widget displaying the question text
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // Adds a spacing of 30 pixels between the question and the answer buttons
            const SizedBox(height: 30),
            // Iterates through the current question's answers
            ...currentQuestion.getShuffledAnswers().map((answer) {
              // Creates an AnswerButton widget for each answer
              return AnswerButton(
                // Sets the answer text for the button
                answerText: answer,

                onTap: () {
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
