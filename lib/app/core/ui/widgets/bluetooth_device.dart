import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../helpers/messages.dart';

class BluetoothDevice extends StatefulWidget {
  final DiscoveredDevice device;
  final VoidCallback? onPressed;

  const BluetoothDevice({
    super.key,
    required this.device,
    this.onPressed,
  });

  @override
  State<BluetoothDevice> createState() => _BluetoothDeviceState();
}

class _BluetoothDeviceState extends State<BluetoothDevice> with Messages {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.device.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                widget.device.id,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
