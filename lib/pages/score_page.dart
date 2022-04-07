import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/models/player.dart';

class ScorePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Scores"),
      ),
      body: Center(child: buildScore(context)),
    );
  }

  Widget buildScore(BuildContext context){
    final playerScores = ScoreManager.instance.players.map((Player p){
      return TableRow(children: [
        Column(children: [Text(p.name)]),
        Column(children: [Text(p.score.toString())]),
        Column(children: [Text(p.respondedQuestions.toString())])
      ]);
    });
    return Table(
      border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 1),  
      children: [
        TableRow(children: [
          Column(children: [Text("Nom",style: TextStyle(fontSize: 20.0))]),
          Column(children: [Text("Score",style: TextStyle(fontSize: 20.0))]),
          Column(children: [Text("Questions répondu",style: TextStyle(fontSize: 20.0))]),
        ]),
        ...playerScores
        ]
      );
  }
  
}