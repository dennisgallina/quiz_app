import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // The question mark allow to assign a null value
  Widget? activeScreen;

  // Executed when the StatefulWidget's State object is initialized
  @override
  void initState() {
    // If pass a function in a Object Constructor, it can be used whereever
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    // Re-executed the built() an other
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  // Executed when the Widget is built for the first time
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}
