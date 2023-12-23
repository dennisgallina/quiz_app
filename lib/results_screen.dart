import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  // This widget displays the results of the quiz

  const ResultsScreen({
    super.key,
    required this.chosenAnswer, // List of selected answers by the user
    required this.onRestart, // Callback to restart the quiz
  });

  // List of selected answers by the user
  final List<String> chosenAnswer;

  // Callback to restart the quiz
  final void Function() onRestart;

  // Function to generate the summary data
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  // Build the widget for the ResultsScreen
  @override
  Widget build(BuildContext context) {
    // Retrieve the summary data from the getSummaryData() function
    final summaryData = getSummaryData();

    // Calculate the number of total and correct questions
    final int numberTotalQuestions = questions.length;
    final int numberCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    // Create a SizedBox widget with the specified width and height
    return SizedBox(
      width: double.infinity, // Set the width to double.infinity
      child: Container(
        // Add a margin of 40 pixels around the widget
        margin: const EdgeInsets.all(40),

        // Display the quiz results
        child: Column(
          // Align children along the main axis (vertically)
          mainAxisAlignment: MainAxisAlignment.center,

          // Align children within their respective containers (stretch)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // Display the summary text
          children: [
            // Display the user's score
            Text(
              'You answered ${numberCorrectQuestions} out of ${numberTotalQuestions} questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white, // Set the text color to white
                fontSize: 20, // Set the text font size to 20 pixels
              ),
              textAlign: TextAlign.center, // Align the text to the center
            ),

            const SizedBox(
                height: 30), // Add spacing between the title and the summary

            // Display the questions summary
            QuestionsSummary(
              // Pass the summary data to the QuestionsSummary widget
              summaryData: summaryData,
            ),

            const SizedBox(
                height:
                    30), // Add spacing between the summary and the 'Restart Quiz' button

            // Create a TextButton.icon widget to display the 'Restart Quiz' button
            TextButton.icon(
              // Call the onTap callback to restart the quiz
              onPressed: onRestart,

              // Set the icon to a refresh icon
              icon: const Icon(Icons.refresh_outlined),

              // Set the button text to 'Restart Quiz!'
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
