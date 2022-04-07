import 'package:get_it/get_it.dart';
import 'package:quiz/models/player.dart';

class ScoreManager {
  List<Player> players = [];

  void addPlayer(Player player){
    players.add(player);
  }
  static void register(){
    GetIt.I.registerLazySingleton(() => ScoreManager());
  }
  static ScoreManager get instance => GetIt.I.get<ScoreManager>();
}