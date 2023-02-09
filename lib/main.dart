import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_ragnarok_flutter/app/core/repositories/bluetooth_repository_impl.dart';
import 'package:remote_ragnarok_flutter/app/core/ui/theme/theme_config.dart';
import 'package:remote_ragnarok_flutter/app/pages/connection_page.dart';
import 'package:remote_ragnarok_flutter/app/pages/remote_control_page.dart';

import 'app/core/provider/application_bindinds.dart';

void main() {
  runApp(const RemoteRagnarokApp());
}

class RemoteRagnarokApp extends StatelessWidget {
  const RemoteRagnarokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBindinds(
      child: Provider(
        create: (context) => BluetoothRepositoryImpl(),
        child: MaterialApp(
          title: 'Remote Ragnarok App',
          theme: ThemeConfig.theme,
          //darkTheme: ThemeData.dark(),
          routes: {
            '/': (context) => const ConnectionPage(),
            '/remote': (context) => const RemoteControlPage(),
          },
        ),
      ),
    );
  }
}
