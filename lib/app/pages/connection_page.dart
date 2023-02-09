import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:remote_ragnarok_flutter/app/core/repositories/bluetooth_repository_impl.dart';
import 'package:remote_ragnarok_flutter/app/core/ui/widgets/bluetooth_device.dart';

import '../core/ui/helpers/messages.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> with Messages {
  String status = "No device detected";
  String deviceId = "";

  final bluetoothRepository = BluetoothRepositoryImpl();

  Map<String, DiscoveredDevice> devices = {};

  scanDevices() async {
    final result = await bluetoothRepository.findAllDevices();

    setState(() {
      devices = result;
    });
  }

  handleConnection(device) async {
    final stream = bluetoothRepository.connectToDevice(device);

    stream.listen((connectionEvent) {
      // Handle connection state updates
      switch (connectionEvent.connectionState) {
        case DeviceConnectionState.connecting:
          // showInfo('Connecting');
          break;
        case DeviceConnectionState.connected:
          showSuccess('Connected');
          Navigator.of(context).popAndPushNamed('/remote');
          break;
        case DeviceConnectionState.disconnecting:
          // showInfo('Disconnecting');
          break;
        case DeviceConnectionState.disconnected:
          showError('Disconnected');
          break;
      }
    }, onError: (Object error) {
      // Handle a possible error
      showError('Erro na comunicação via bluetooth $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF363636),
      appBar: AppBar(
        backgroundColor: Color(0XFF4F4F4F),
        title: Center(child: Text('ConnectionPage')),
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanDevices,
        child: const Icon(Icons.bluetooth_searching),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          final keys = devices.keys.toList();
          final device = devices[keys[index]];
          return BluetoothDevice(
            device: device!,
            onPressed: () => handleConnection(device),
          );
        },
      ),
    );
  }
}
