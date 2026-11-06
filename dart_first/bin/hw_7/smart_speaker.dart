import 'device.dart';
import 'adjustable.dart';
import 'battery-powered.dart';

class SmartSpeaker extends Device
    with BatteryPowered
    implements Adjustable {

  int volume = 50;

  SmartSpeaker(String name) : super(name);

  @override
  void turnOn() {
    print('Speaker $name is ON');
  }

  @override
  void turnOff() {
    print('Speaker $name is OFF');
  }

  @override
  void increase() {
    if (volume < 100) {
      volume += 5;
    }

    if (volume > 100) {
      volume = 100;
    }

    print('Speaker volume: $volume%');
  }

  @override
  void decrease() {
    if (volume > 0) {
      volume -= 5;
    }

    if (volume < 0) {
      volume = 0;
    }

    print('Speaker volume: $volume%');
  }

  @override
  void showInfo() {
    print('Speaker: $name | Volume: $volume%');
  }
}