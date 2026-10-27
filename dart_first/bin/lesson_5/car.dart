import 'person.dart';

class Car {
  // поля / атрибуты
  int year;
  String model;
  String color;
  Person? owner;

  // конструктор
  // Car(int year, String model, String color) {
  //   this.year = year;
  //   this.model = model;
  //   this.color = color;
  // }

  // Конструктор с инициализирующим списком
  // Car(int year, String model, String color)
  //   : this.year = year,
  //     this.model = model,
  //     this.color = color;

  // Конструктор с параметрами, присваивающимися напрямую
  Car(this.year, this.model, this.color);
  Car.redHondaCivic(this.year) : model = 'Honda Civic', color = 'red';
  Car.white(this.year, this.model) : color = 'white';
  Car.withOwner(this.year, this.model, this.color, this.owner);

  // методы
  void drive(String city) {
    print('Car $model is driving to $city');
  }

  void repaint(String newColor) {
    color = newColor;
  }

  void displayInfo() {
    if (owner != null) {
      print('MODEL: $model YEAR: $year COLOR: $color OWNER: Mr/Mrs ${owner!.surname}');
    } else {
      print('MODEL: $model YEAR: $year COLOR: $color');
    }
  }

  void honk(int numberOfTimes) {
    while (numberOfTimes > 0) {
      print('$color car makes honk: BEEP');
      numberOfTimes--;
    }
  }
}
