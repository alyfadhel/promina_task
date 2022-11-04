import 'package:flutter/material.dart';
import 'package:promina/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final Color background;
  final Function() function;
  final String text;
  final TextStyle? style;
  final bool isUpperCase;
  final double? radius;
  const CustomButton({Key? key,
    this.width = double.infinity,
    this.background = ColorManager.mGreen,
    required this.function,
    required this.text,
    this.style,
    this.isUpperCase = true,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(radius!)
          ),
          child: MaterialButton(
            onPressed: function,
            child: Text(
             isUpperCase ? text.toUpperCase() : text,
              style: style,
            ),
          ),
        ),
      ],
    );
  }
}
