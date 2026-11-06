import 'rpg_game.dart';

enum SuperAbility {
  heal,
  boost,
  criticalDamage,
  blockRevert,
  dodge,
  resurrect,
  protect,
  stun,
}

abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  set health(int value) {
    _health = value < 0 ? 0 : value;
  }

  int get health => _health;

  GameCharacter(this.name, this._health, this.damage);

  bool isAlive() => health > 0;

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;

  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void attack(List<Hero> heroes) {
    Golem? golem;

    for (Hero h in heroes) {
      if (h is Golem && h.isAlive()) {
        golem = h;
        break;
      }
    }

    for (Hero h in heroes) {
      if (!h.isAlive()) continue;

      if (h is Lucky) {
        if (RpgGame.random.nextInt(100) < 25) {
          print('Lucky ${h.name} dodged the attack!');
          continue;
        }
      }

      if (h is Golem) {
        h.health -= damage;
        continue;
      }

      int blockedDamage = damage ~/ 5;

      if (golem != null && golem.isAlive()) {
        golem.health -= blockedDamage;

        if (h is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5;
          h.blockedDamage = block;

          int finalDamage = damage - blockedDamage - block;
          if (finalDamage < 0) finalDamage = 0;

          h.health -= finalDamage;
        } else {
          h.health -= damage - blockedDamage;
        }
      } else {
        if (h is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5;
          h.blockedDamage = block;

          int finalDamage = damage - block;
          if (finalDamage < 0) finalDamage = 0;

          h.health -= finalDamage;
        } else {
          h.health -= damage;
        }
      }
    }
  }

  void chooseDefence() {
    
    List<SuperAbility> variants = SuperAbility.values
        .where(
          (ability) =>
              ability != SuperAbility.dodge &&
              ability != SuperAbility.resurrect &&
              ability != SuperAbility.protect,
        )
        .toList();

    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }

  @override
  String toString() {
    if (defence == null) {
      return '${super.toString()} defence: No defence';
    } else {
      return '${super.toString()} defence: ${defence!.name}';
    }
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage;
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  bool hasBoosted = false;

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4 && !hasBoosted) {
      for (Hero h in heroes) {
        if (h.isAlive() && h != this) {
          h.damage += 5;
        }
      }
      hasBoosted = true;
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;

  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
    blockedDamage = 0;
  }
}

class Healer extends Hero {
  int healPoints;

  Healer(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive() && h != this) {
        h.health += healPoints;
      }
    }
  }
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.dodge);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.resurrect);

  bool hasResurrected = false;

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (isAlive() && !h.isAlive() && !hasResurrected) {
        h.health = health;
        health = 0;
        print('Witcher $name sacrificed himself to resurrect ${h.name}');
        hasResurrected = true;
        break;
      }
    }
  }
}

class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.protect);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}
class Thor extends Hero {
  Thor(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}