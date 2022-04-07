import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:quiz/managers/quiz_session.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/models/player.dart';
import 'package:quiz/pages/menu_page.dart';

class GameoverPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final session = GetIt.I.get<QuizSession>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Game Over"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text("GAME OVER", textScaleFactor: 2.0),
            Spacer(),
            Text("Your score", textScaleFactor: 1.5),
            Text("${session.score}", style: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant),
              textScaleFactor: 2.0,
            ),
            Spacer(),
            Text("For answering ${session.questionsCount} questions", textScaleFactor: 1.5),
            Spacer(),
            Form(
              key: _formKey,
              child: TextFormField(
                onSaved: (username) {
                  if(username != "")
                    ScoreManager.instance.addPlayer(Player(session.score, username!, session.questionsCount));
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () { 
                _formKey.currentState!.save();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPage()));
                },
              child: Text("Back to Menu", textScaleFactor: 2.0, textAlign: TextAlign.center),
            ),
            Spacer(),
          ],
        ),
      )
    );
  }
}
