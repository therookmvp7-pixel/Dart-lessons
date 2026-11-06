mixin BatteryPowered {
  int batteryLevel = 100;

  void showBattery() {
    print('Battery level: $batteryLevel%');
  }
}