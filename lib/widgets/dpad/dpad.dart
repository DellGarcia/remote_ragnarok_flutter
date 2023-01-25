import 'package:flutter/material.dart';

import 'package:remote_ragnarok_flutter/widgets/custom_button/custom_button.dart';

class DPad extends StatefulWidget {
  const DPad({super.key});

  @override
  State<DPad> createState() => _DPadState();
}

class _DPadState extends State<DPad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: 50,
              height: 50,
              onPressed: () {},
              borderRadius: BorderRadius.circular(16),
              content: const Icon(Icons.arrow_upward_rounded),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: 50,
              height: 50,
              onPressed: () {},
              borderRadius: BorderRadius.circular(16),
              content: const Icon(Icons.arrow_back_rounded),
            ),
            CustomButton(
              width: 50,
              height: 50,
              onPressed: () {},
              borderRadius: BorderRadius.circular(16),
              content: const Icon(Icons.arrow_forward_rounded),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: 50,
              height: 50,
              onPressed: () {},
              borderRadius: BorderRadius.circular(16),
              content: const Icon(Icons.arrow_downward_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
