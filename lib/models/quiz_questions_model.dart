class QuizQuestions{
  final String question;
  final List<String> answers;

  QuizQuestions(this.question, this.answers);

  List<String> shuffledAnswers(){
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}