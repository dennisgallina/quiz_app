import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: summaryData.map((data) {
            return Flex(
              direction: Axis.horizontal,
              children: [
                // CircleAvatar widget
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Text(((data['question_index'] as int) + 1).toString()),
                ),

                // SizedBox widget for spacing
                const SizedBox(width: 20),

                // Column widget for question and answer text
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question text
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                      // User answer text
                      Row(
                        children: [
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),

                      // Correct answer text
                      Row(
                        children: [
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(color: Colors.lightBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
