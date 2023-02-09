import 'package:flutter/material.dart';
import 'package:remote_ragnarok_flutter/app/core/ui/styles/colors_app.dart';

class CustomButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final VoidCallback? onReleased;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  final double padding;

  const CustomButton({
    super.key,
    this.onPressed,
    this.onReleased,
    this.borderRadius,
    this.width = 120,
    this.height = 40,
    this.padding = 37,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
        bottom: (padding - height / 2),
        top: (padding - height / 2),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: GestureDetector(
          onTapDown: (_) => onPressed!(),
          onTapUp: (_) => onReleased!(),
          child: Container(
            color: context.colors.primary,
            child: Padding(padding: const EdgeInsets.all(0), child: icon),
          ),
        ),
      ),
    );
  }
}
