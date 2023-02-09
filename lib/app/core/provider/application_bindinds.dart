import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_ragnarok_flutter/app/core/repositories/bluetooth_repository_impl.dart';

class ApplicationBindinds extends StatelessWidget {
  final Widget child;

  const ApplicationBindinds({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => {},
        ),
      ],
      child: child,
    );
  }
}
