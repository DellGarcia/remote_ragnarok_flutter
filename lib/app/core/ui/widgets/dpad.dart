import 'package:flutter/material.dart';
import 'package:remote_ragnarok_flutter/app/core/ui/widgets/custom_button.dart';

class DPad extends StatefulWidget {
  final VoidCallback? uperClick;
  final VoidCallback? bottomClick;
  final VoidCallback? rightClick;
  final VoidCallback? leftClick;
  final VoidCallback? onReleased;

  const DPad({
    super.key,
    required this.uperClick,
    required this.bottomClick,
    required this.rightClick,
    required this.leftClick,
    required this.onReleased,
  });

  @override
  State<DPad> createState() => _DPadState();
}

class _DPadState extends State<DPad> {
  final String serviceUUID = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E";
  final String rxCharacteristic = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E";
  final String deviceName = "ragnarok";
  final double buttonSize = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: buttonSize,
              height: buttonSize,
              onPressed: widget.uperClick,
              onReleased: widget.onReleased,
              borderRadius: BorderRadius.circular(16),
              icon: const Icon(
                Icons.keyboard_arrow_up_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: buttonSize,
              height: buttonSize,
              onPressed: widget.leftClick,
              onReleased: widget.onReleased,
              borderRadius: BorderRadius.circular(16),
              icon: const Icon(
                Icons.keyboard_arrow_left_outlined,
                color: Colors.black,
              ),
            ),
            CustomButton(
              width: buttonSize,
              height: buttonSize,
              onPressed: widget.rightClick,
              onReleased: widget.onReleased,
              borderRadius: BorderRadius.circular(16),
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: buttonSize,
              height: buttonSize,
              onPressed: widget.bottomClick,
              onReleased: widget.onReleased,
              borderRadius: BorderRadius.circular(16),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
