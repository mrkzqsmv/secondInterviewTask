import 'package:flutter/material.dart';
import 'package:todoapp/src/models/task_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TaskModel> _todos = [];

  List<TaskModel> get todos => _todos;

  final List<TaskModel> _completedTodos = [];

  List<TaskModel> get completedTodos => _todos;

  void addTodo(TaskModel task) {
    final newTodo = TaskModel(
      name: task.name,
      desc: task.desc,
      startDate: task.startDate,
      endDate: task.endDate,
      priority: task.priority,
      alert: task.alert,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void removeTask(TaskModel task) {
    _todos.remove(task);
    notifyListeners();
  }

  void complete(TaskModel task) {
    _completedTodos.add(task);
    removeTask(task);
    notifyListeners();
  }
}
