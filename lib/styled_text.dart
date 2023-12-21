import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.size, this.color, {super.key});

  final String text;
  final double size;
  final Color? color;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
