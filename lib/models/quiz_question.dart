class QuizQuestion {
  // Constructor for the QuizQuestion class
  const QuizQuestion(this.question, this.answers);

  // Stores the question text
  final String question;
  // Stores the list of answer options
  final List<String> answers;

  // Generates a shuffled list of answer options
  List<String> getShuffledAnswers() {
    // Creates a copy of the answer list
    final shuffledAnswers = List.of(answers);
    // Shuffles the order of the answer options
    shuffledAnswers.shuffle();
    // Returns the shuffled list of answer options
    return shuffledAnswers;
  }
}
