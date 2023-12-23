import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.onTap,
  });

  final List<String> chosenAnswer;
  final void Function() onTap;

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

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int numberTotalQuestions = questions.length;
    final numberCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

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
            Text(
              'You answered $numberCorrectQuestions out of $numberTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onTap,
              icon: const Icon(
                Icons.refresh_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
