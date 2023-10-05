import 'package:flutter/material.dart';
import 'package:quiz_app/models/data/quiz_questions.dart';
import 'package:quiz_app/modules/result/result_screen.dart';
import 'package:quiz_app/modules/start/start_screen.dart';
import 'package:quiz_app/shared/component/component.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionNumber = 0;
  List<String> userAnswers = [];
  List<String> userRightAnswers = [];

  void changeQuestionNumber(String answer) {
    setState(() {
      userAnswers.add(answer);
      if (questionNumber < questions.length - 1) {
        if (answer == questions[questionNumber].answers[0]) {
          userRightAnswers.add(answer);
        }
        questionNumber++;
      } else
      {
        if (answer == questions[questionNumber].answers[0]) {
          userRightAnswers.add(answer);
        }
        showMyDialog(
          context: context,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Your score = ${userRightAnswers.length}"),
              Text("Your wrong answer = ${userAnswers.length - userRightAnswers.length}"),
            ],
          ),
          title: const Text("Flutter Quiz Result"),
          barrierDismissible: false,
          actions: [
            TextButton(
                onPressed: (){
                  userAnswers = [];
                  userRightAnswers = [];
                  navigateTo(context, const StartScreen());
                },
                child: const Text("Restart Quiz")),
            TextButton(
                onPressed: (){
                  navigateAndFinish(context, ResultScreen(userRightAnswers, userAnswers));
                },
                child: const Text("Show your Results")),
          ]
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[questionNumber];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellowAccent,
              Colors.redAccent,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQuestion.question,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                ...currentQuestion.shuffledAnswers().map((e) {
                  return MyButton(
                      margin: 5,
                      padding: 10,
                      onPress: () => changeQuestionNumber(e),
                      width: double.infinity,
                      child: Text(
                        e,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      color: Colors.white);
                })
              ]),
        ),
      ),
    );
  }
}
