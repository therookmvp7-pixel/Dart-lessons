class Person {
  String _name;
  String _surname;
  int _age;

  Person(this._name, this._surname, this._age) {
    _wasBorn();
  }

  void _wasBorn() {
    print('$_name was born');
  }

  // void setAge(int newAge) {
  //   if (newAge > 0) {
  //     _age = newAge;
  //   } else {
  //     print('Wrong value age must be positive number.');
  //   }
  // }

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print('Wrong value age must be positive number.');
    }
  }

  // String getName() {
  //   return _name;
  // }

  String get name => _name;
  String get surname => _surname;

  int calculateBirthYear() {
    return 2026 - _age;
  }

  void displayInfo() {
    print(
      'My full name is $_name $_surname. I am $_age years old. I was born in ${calculateBirthYear()}',
    );
  }
}
