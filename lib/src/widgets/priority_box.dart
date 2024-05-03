import 'package:flutter/material.dart';
import 'package:todoapp/src/constants/color_constants.dart';

class PriorityBox extends StatelessWidget {
  final String priorityLevel;
  final dynamic onTap;
  final dynamic borderColor;
  const PriorityBox(
      {super.key, required this.priorityLevel, this.onTap, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          border: Border.all(color: ConstantsColors.whiteColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            priorityLevel,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
