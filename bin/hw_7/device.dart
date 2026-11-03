import 'switchable.dart';

abstract class Device implements Switchable {
  final String name;

  Device(this.name);

  void turnOn();
  void turnOff();

  void showInfo() {
    print('Device: $name');
  }
}