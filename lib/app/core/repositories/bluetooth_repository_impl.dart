import 'dart:io';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:remote_ragnarok_flutter/app/core/extensions/string_encoder.dart';

import './bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final String serviceUUID = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E";
  final String rxUUID = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E";
  final String deviceName = "ragnarok";

  final _ble = FlutterReactiveBle();

  static String lastConnectionId = '';

  @override
  Future<bool> requestForBluetoothPermission() async {
    PermissionStatus permission;

    bool permissionGranted = false;

    if (Platform.isAndroid) {
      permission = await LocationPermissions().requestPermissions();
      if (permission == PermissionStatus.granted) permissionGranted = true;
    } else if (Platform.isIOS) {
      permissionGranted = true;
    }

    return permissionGranted;
  }

  @override
  Future<List<DiscoveredDevice>> findAllDevices() async {
    bool permissionGranted = await requestForBluetoothPermission();

    if (permissionGranted) {
      return await _ble
          .scanForDevices(
            withServices: [],
            scanMode: ScanMode.balanced,
          )
          .where((device) => device.name.isNotEmpty)
          .toList();
    }

    return const [];
  }

  @override
  Stream<ConnectionStateUpdate> connectToDevice(DiscoveredDevice device) {
    lastConnectionId = device.id;

    return _ble.connectToAdvertisingDevice(
      id: device.id,
      withServices: [],
      connectionTimeout: const Duration(seconds: 5),
      prescanDuration: const Duration(seconds: 5),
    );
  }

  @override
  void sendCommand(String command) {
    final characteristic = QualifiedCharacteristic(
      serviceId: Uuid.parse(serviceUUID),
      characteristicId: Uuid.parse(rxUUID),
      deviceId: lastConnectionId,
    );

    _ble.writeCharacteristicWithoutResponse(
      characteristic,
      value: command.bytes,
    );
  }
}
