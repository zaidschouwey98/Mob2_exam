import 'package:flutter/material.dart';

import 'package:quiz/pages/game_page.dart';
import 'package:quiz/pages/score_page.dart';
import 'package:quiz/services/static_question_repository.dart';
import 'package:quiz/managers/rookie_quiz_session.dart';
import 'package:quiz/managers/journeyman_quiz_session.dart';
import 'package:quiz/managers/warrior_quiz_session.dart';
import 'package:quiz/managers/ninja_quiz_session.dart';

class MenuPage extends StatelessWidget {
  //final _questionRepository = new RemoteQuestionRepository(Uri.parse("http://10.0.2.2:4567/questions/next"));
  final _questionRepository = new StaticQuestionRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => GamePage(RookieQuizSession(questionRepository: _questionRepository))
                ));
              },
              child: Text("Rookie", textScaleFactor: 2.0, textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => GamePage(JourneymanQuizSession(questionRepository: _questionRepository))
                ));
              },
              child: Text("Journeyman", textScaleFactor: 2.0, textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => GamePage(WarriorQuizSession(questionRepository: _questionRepository))
                ));
              },
              child: Text("Warrior", textScaleFactor: 2.0, textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => GamePage(NinjaQuizSession(questionRepository: _questionRepository))
                ));
              },
              child: Text("Ninja", textScaleFactor: 2.0, textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ScorePage()
                ));
              },
              child: Text("Scores", textScaleFactor: 2.0, textAlign: TextAlign.center),
            ),
          ],
        ),
      )
    );
  }
}
