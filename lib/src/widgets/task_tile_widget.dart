import 'package:flutter/material.dart';
import 'package:todoapp/src/constants/color_constants.dart';
class TaskTileWidget extends StatefulWidget {
  final String title;
  final String date;
  final bool isCompleted;
  final dynamic todo;
  const TaskTileWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.isCompleted,
      this.todo});

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  var isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ConstantsColors.white12Color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.date_range),
                  const SizedBox(width: 5),
                  Text(
                    widget.date,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          Checkbox(
              value: isCompleted,
              onChanged: (newValue) {
                setState(() {
                  isCompleted = newValue!;
                });
              })
        ],
      ),
    );
  }
}
