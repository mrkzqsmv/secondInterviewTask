import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final Color buttonTextColor;
  final Function onTap;
  final dynamic height;
  const ButtonWidget(
      {super.key,
      required this.buttonText,
      required this.bgColor,
      required this.buttonTextColor,
      required this.onTap, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}
