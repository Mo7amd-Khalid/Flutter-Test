import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quiz/quiz_screen.dart';
import 'package:quiz_app/modules/start/start_screen.dart';
import 'package:quiz_app/shared/component/icon_broken.dart';

import '../../models/data/quiz_questions.dart';
import '../../shared/component/component.dart';

class ResultScreen extends StatefulWidget {
  final List<String> user;
  final List<String> right;

  const ResultScreen(this.right, this.user, {super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int questionNumber = 0;
  String appBarText = 'Next';

  void changeQuestionNumber() {
    if (questionNumber < questions.length - 1) {
      setState(() {
        questionNumber++;
        if(questionNumber == 9)
          {
            setState(() {
              appBarText = 'Restart';
            });
          }
      });
    }else
      {
        showMyDialog(
            context: context,
            content: Text('Do you need to restart the quiz?'),
          actions: [
            TextButton(onPressed: (){
              navigateAndFinish(context, const QuizScreen());
            }, child: const Text('YES')),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('NO')),
          ]
        );

      }
  }

  Color answerColor(String e) {
    if (e == questions[questionNumber].answers[0] && e == widget.user[questionNumber])
    {
      return Colors.green;
    } else
      {
        if(e == questions[questionNumber].answers[0])
          {
            return Colors.green;
          }else if(e == widget.user[questionNumber])
            {
              return Colors.red;
            }else
              {
                return Colors.white;
              }

      }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[questionNumber];
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellowAccent,
                Colors.redAccent,
              ],
            ),
          ),
        ),
        leading: IconButton(
          onPressed: (){
            navigateAndFinish(context, const StartScreen());
          },
          icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.white,),
        ),
        actions: [
          TextButton(
            onPressed: () => changeQuestionNumber(),
            child: Row(
              children: [
                Text(
                  appBarText,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                const Icon(IconBroken.Arrow___Right_2,color: Colors.white,),
              ],
            )),
        ]
      ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: answerColor(e),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      e,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
              ]),
        ),
      ),
    );

  }
}
