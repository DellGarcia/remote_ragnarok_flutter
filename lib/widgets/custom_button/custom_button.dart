import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatefulWidget {
  final Icon content;
  final Color color;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.width = 100,
    this.height = 40,
    this.color = Colors.amber,
    this.borderRadius,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late final BorderRadius borderRadius;

  @override
  void initState() {
    super.initState();

    borderRadius = widget.borderRadius ?? BorderRadius.circular(8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 4, 30, 4),
      child: Material(
        color: widget.color,
        borderRadius: borderRadius,
        elevation: 5,
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: borderRadius,
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: widget.content,
          ),
        ),
      ),
    );
  }
}
