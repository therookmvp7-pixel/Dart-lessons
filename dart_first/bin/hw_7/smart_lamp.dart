import 'device.dart';
import 'adjustable.dart';
import 'battery-powered.dart';

class SmartLamp extends Device
    with BatteryPowered
    implements Adjustable {

  int brightness = 50;

  SmartLamp(String name) : super(name);

  @override
  void turnOn() {
    print('Lamp $name is ON');
  }

  @override
  void turnOff() {
    print('Lamp $name is OFF');
  }

  @override
  void increase() {
    if (brightness < 100) {
      brightness += 10;
    }

    if (brightness > 100) {
      brightness = 100;
    }

    print('Lamp brightness: $brightness%');
  }

  @override
  void decrease() {
    if (brightness > 0) {
      brightness -= 10;
    }

    if (brightness < 0) {
      brightness = 0;
    }

    print('Lamp brightness: $brightness%');
  }

  @override
  void showInfo() {
    print('Lamp: $name | Brightness: $brightness%');
  }
}