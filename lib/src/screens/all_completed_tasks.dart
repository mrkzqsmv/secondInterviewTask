import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/src/router/router.dart';
import 'package:todoapp/src/screens/todo_detail_screen.dart';
import 'package:todoapp/src/widgets/task_tile_widget.dart';

import '../providers/task_provider.dart';

class AllCompletedTasks extends StatefulWidget {
  const AllCompletedTasks({super.key});

  @override
  State<AllCompletedTasks> createState() => _AllCompletedTasksState();
}

class _AllCompletedTasksState extends State<AllCompletedTasks> {
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
          title: const Text('All Completed Tasks'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Provider.of<TodoProvider>(context).completedTodos.isNotEmpty
              ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodoDetailScreen(
                                      todo: Provider.of<TodoProvider>(context)
                                          .completedTodos[index],
                                    )));
                      },
                      child: TaskTileWidget(
                          todo: Provider.of<TodoProvider>(context)
                              .completedTodos[index],
                          title: Provider.of<TodoProvider>(context)
                              .completedTodos[index]
                              .name,
                          date: Provider.of<TodoProvider>(context)
                              .completedTodos[index]
                              .startDate,
                          isCompleted: Provider.of<TodoProvider>(context)
                              .completedTodos[index]
                              .alert),
                    );
                  }),
                  itemCount:
                      Provider.of<TodoProvider>(context).completedTodos.length,
                )
              : const Center(
                  child: Text('There is not completed todos'),
                ),
        ),
      ),
    );
  }
}
