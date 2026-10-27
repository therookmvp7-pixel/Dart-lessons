import 'car.dart';
import 'person.dart';

void main() {
  int number = 9;
  Car myCar = Car(2020, 'Toyota Camry', 'red');
  Car bestCar = Car(2009, 'Lexus LX 570', 'black');
  print(number);
  myCar.displayInfo();
  bestCar.displayInfo();
  // myCar.color = 'yellow';
  myCar.repaint('yellow');
  myCar.displayInfo();
  myCar.drive('Osh');
  bestCar.drive('Kant');
  myCar.drive('Batken');

  Car friendsCar = Car.redHondaCivic(2000);
  friendsCar.displayInfo();
  friendsCar.honk(3);

  Person friend = Person('Jane', 'Brown', 20);
  // friend._age = -21;
  // friend.setAge(-21);
  friend.age = -21;
  friend.displayInfo();
  // print(friend._age);
  // print('Name of my friend is ${friend.getName()}');
  print('Name of my friend is ${friend.name}');

  Car fastCar = Car.withOwner(2025, 'Ford Mustang', 'blue', friend);
  friendsCar.owner = friend;
  fastCar.displayInfo(); 
  friendsCar.displayInfo();
  // Person me = Person('Jim', 'Smith', 40);
  //        a  = b
  myCar.owner = Person('Jim', 'Smith', 40);
  myCar.displayInfo();
  print('End of program');
}
