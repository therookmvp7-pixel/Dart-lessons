import 'game_characters.dart';
import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    roundNumber = 0;

    Boss boss = Boss('Dragon', 1500, 50);

    Warrior warrior1 = Warrior('Ahiles', 280, 15);
    Warrior warrior2 = Warrior('Hercules', 290, 10);
    Magic magic = Magic('Stange', 270, 15);
    Berserk berserk = Berserk('Axe', 260, 10);
    Healer doc = Healer('Jake', 250, 5, 15);
    Healer assistant = Healer('Junior', 300, 5, 5);
    Lucky lucky = Lucky('Caleb', 200, 10);
    Witcher witcher = Witcher('Geralt', 260, 10);
    Golem ben = Golem('Golem', 500, 5);
    Thor thor = Thor('Loki', 300, 20);

    List<Hero> heroes = [
      warrior1,
      doc,
      magic,
      berserk,
      warrior2,
      assistant,
      lucky,
      witcher,
      ben,
      thor,
    ];

    _showStatistics(boss, heroes);

    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber =========================');
    print(boss);

    for (Hero h in heroes) {
      print(h);
    }
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;

    boss.chooseDefence();
    if (boss.isStunned) {
      print('Boss skipped this round!');
      boss.isStunned = false;
    } else {
      boss.attack(heroes);
    }

    for (Hero h in heroes) {
      if (h is Witcher && boss.isAlive()) {
        h.applySuperPower(boss, heroes);
      }

      if (h.isAlive() &&
          boss.isAlive() &&
          h.ability != boss.defence &&
          h is! Witcher) {
        h.attack(boss);
        h.applySuperPower(boss, heroes);
      }
    }

    _showStatistics(boss, heroes);
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!!');
      return true;
    }

    bool allHeroesDead = true;

    for (Hero h in heroes) {
      if (h.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }

    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }

    return false;
  }
}
