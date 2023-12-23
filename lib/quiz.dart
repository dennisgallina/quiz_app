import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart'; // Imports the questions data file
import 'package:quiz/questions_screen.dart'; // Imports the QuestionsScreen widget
import 'package:quiz/results_screen.dart'; // Imports the ResultsScreen widget
import 'package:quiz/start_screen.dart'; // Imports the StartScreen widget

class Quiz extends StatefulWidget {
  // Constructor for the Quiz widget
  const Quiz({super.key});

  @override
  // Creates the state for the Quiz widget
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // List to store the selected answers
  List<String> selectedAnswers = [];

  // Widget variable to hold the currently active screen
  // The question mark indicates that the value can be null
  Widget? activeScreen;

  // Function called when the widget is first initialized
  @override
  void initState() {
    // Set the initial active screen to the StartScreen
    activeScreen = StartScreen(switchScreen);

    super.initState();
  }

  // Function to switch to the QuestionsScreen
  void switchScreen() {
    // Re-build the widget to reflect the change
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  // Function to handle the user's selected answer
  void chooseAnswer(String answer) {
    // Add the selected answer to the list
    selectedAnswers.add(answer);

    // Check if all questions have been answered
    if (selectedAnswers.length == questions.length) {
      // Navigate to the ResultsScreen
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswer: selectedAnswers,
          onTap: restartQuiz,
        );
      });
    }
  }

  // Function to restart the quiz
  void restartQuiz() {
    // Reset the selected answers list
    selectedAnswers = [];

    // Navigate back to the StartScreen
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  // Function to build the widget for the first time
  @override
  Widget build(context) {
    // Create a MaterialApp widget
    return MaterialApp(
      home: Scaffold(
        // Set the background color to a gradient
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Add the active screen to the body of the Scaffold
          child: activeScreen,
        ),
      ),
    );
  }
}
