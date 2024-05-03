import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';
import 'package:todoapp/src/providers/task_provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var countOfTasks = Provider.of<TodoProvider>(context).todos.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(
            'You have got $countOfTasks tasks today to complete',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SvgPicture.asset('lib/src/assets/vectors/bg_img.svg'),
      ],
    );
  }
}
