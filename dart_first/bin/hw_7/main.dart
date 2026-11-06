import 'device.dart';
import 'adjustable.dart';
import 'battery-powered.dart';

import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';

void main() {

  List<Device> devices = [
    SmartLamp('Bedroom Lamp'),
    SmartSpeaker('JBL Speaker'),
    SmartThermostat('Home Thermostat'),
  ];

  for (Device device in devices) {

    device.showInfo();

    device.turnOn();

   if (device is Adjustable) {
  (device as Adjustable).increase();
}

if (device is BatteryPowered) {
  (device as BatteryPowered).showBattery();
}

    print('--------------------');
  }

  print('All devices processed.');
}