import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote_ragnarok_flutter/app/core/repositories/bluetooth_repository.dart';
import 'package:remote_ragnarok_flutter/app/core/repositories/bluetooth_repository_impl.dart';
import 'package:remote_ragnarok_flutter/app/core/ui/widgets/dpad.dart';

class RemoteControlPage extends StatefulWidget {
  const RemoteControlPage({super.key});

  @override
  State<RemoteControlPage> createState() => _RemoteControlPageState();
}

class _RemoteControlPageState extends State<RemoteControlPage> {
  final BluetoothRepository bluetoothRepository = BluetoothRepositoryImpl();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  sendCommand(String cmd) {
    print('Eviando comando $cmd');
    bluetoothRepository.sendCommand(cmd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF363636),
      body: Center(
        child: DPad(
          uperClick: () => sendCommand('FW'),
          rightClick: () => sendCommand('LT'),
          leftClick: () => sendCommand('RT'),
          bottomClick: () => sendCommand('BW'),
          onReleased: () => sendCommand('ST'),
        ),
      ),
    );
  }
}
