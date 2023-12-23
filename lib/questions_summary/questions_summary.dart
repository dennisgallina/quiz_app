import 'package:flutter/material.dart';
import 'package:quiz/questions_summary/summary_item.dart';

// This widget displays a summary of the user's responses to the quiz questions

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData, // The list of question data
  });

  final List<Map<String, Object>> summaryData; // List of question data

  @override
  Widget build(BuildContext context) {
    // Create a sized box to specify the height of the widget
    return SizedBox(
      height: 400, // Set the height to 400 pixels
      child: SingleChildScrollView(
        // Wrap the children in a single child scroll view to enable scrolling
        // if necessary
        child: Column(
          // Display the question summaries in a column
          children: summaryData // Iterate through the question data
              .map((data) {
            // Create a summary item for each question
            return SummaryItem(itemData: data);
          }).toList(), // Convert the list of maps to a list of widgets
        ),
      ),
    );
  }
}
