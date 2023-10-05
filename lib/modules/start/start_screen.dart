import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quiz/quiz_screen.dart';
import 'package:quiz_app/shared/component/component.dart';
import '../../shared/component/icon_broken.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellowAccent,
              Colors.redAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'Flutter Quiz',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white),
            ),
            Image.asset('assets/image/start1.png',width: 350, height: 350,color: Colors.white,),
            InkWell(
              onTap: (){
                navigateAndFinish(context, QuizScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Test your self',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                  Icon(IconBroken.Arrow___Right,color: Colors.white,size: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
