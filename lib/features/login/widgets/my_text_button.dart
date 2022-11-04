import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {

  final double width;
  final Color background;
  final double radius;
  final Function() onPressedTextButton;
  final String text;
  final bool isUpperCase;

  const MyTextButton({
    Key? key,
  required this.onPressedTextButton,
  required this.text,
  this.width = double.infinity,
  this.background = Colors.blue,
  this.radius = 0.0,
  this.isUpperCase = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),

      ),
      child: TextButton(
        onPressed: onPressedTextButton,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
