import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/src/providers/task_provider.dart';
import 'package:todoapp/src/widgets/task_tile_widget.dart';

import '../router/router.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                CustomRouter.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text('All Todos'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Provider.of<TodoProvider>(context).completedTodos.isNotEmpty ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var currentTodo = Provider.of<TodoProvider>(context).todos[index];
              return TaskTileWidget(title: currentTodo.name, date: currentTodo.startDate, isCompleted: currentTodo.alert);
            },
            itemCount: Provider.of<TodoProvider>(context).todos.length,
          )  : const Center(
            child: Text('There is no task'),
          ),
        ),
      ),
    );
  }
}
