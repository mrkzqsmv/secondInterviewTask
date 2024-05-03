import 'package:flutter/material.dart';
import 'package:todoapp/src/constants/color_constants.dart';

class HeadlineWidget extends StatelessWidget {
  final String title;
  final VoidCallback buttonFunc;
  const HeadlineWidget(
      {super.key, required this.title, required this.buttonFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        TextButton(
            onPressed: () {
              buttonFunc();
            },
            child: const Text(
              'See All',
              style:
                  TextStyle(color: ConstantsColors.purpleColor, fontSize: 16),
            )),
      ],
    );
  }
}
