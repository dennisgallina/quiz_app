import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questions_summary/question_identifier.dart';

// This widget displays a summary of a question, including the question number,
// user's answer, and correct answer.
class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.itemData, // The data of the current question
  });

  final Map<String, Object> itemData; // Data of the current question

  @override
  Widget build(BuildContext context) {
    // Check if the user's answer is correct
    final isCorrectAnswer = itemData['user_answer'] ==
        itemData[
            'correct_answer']; // Compare the user's answer to the correct answer

    // Create a row widget to display the question summary
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .start, // Align the children in a column within the row
      children: [
        // Question identifier widget
        QuestionIdentifier(
            // Display the question number and indicate whether it's correct
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),

        // SizedBox widget to add spacing between the question identifier and the question text
        const SizedBox(width: 20),

        // Expanded widget to expand the child widget and fill the available space
        Expanded(
          child: Column(
            // Display the question text, user's answer, and correct answer in columns
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align the children in a column
            children: [
              // Question text widget
              Text(
                // Display the question text
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    // Apply a Lato font style
                    color: Colors.white, // Set the text color to white
                    fontSize: 16, // Set the text font size to 16 pixels
                    fontWeight:
                        FontWeight.bold // Set the text font weight to bold
                    ),
              ),

              // SizedBox widget to add spacing between the question text and
              // user's answer
              const SizedBox(height: 5),

              // User's answer text widget
              Text(
                itemData['user_answer']
                    as String, // Display the user's answer text
                style: const TextStyle(
                  // Apply a custom text style
                  color: Color.fromARGB(255, 202, 171,
                      252), // Set the text color in a slightly blue color
                ),
              ),

              // Correct answer text widget
              Text(
                itemData['correct_answer']
                    as String, // Display the correct answer text
                style: const TextStyle(
                  // Apply a custom text style
                  color: Color.fromARGB(255, 181, 254,
                      246), // Set the text color in a light blue color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
