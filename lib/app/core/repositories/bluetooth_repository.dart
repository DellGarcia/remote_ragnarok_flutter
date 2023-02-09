import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

abstract class BluetoothRepository {
  Future<bool> requestForBluetoothPermission();

  Future<List<DiscoveredDevice>> findAllDevices();

  Stream<ConnectionStateUpdate> connectToDevice(DiscoveredDevice device);

  void sendCommand(String command);
}
