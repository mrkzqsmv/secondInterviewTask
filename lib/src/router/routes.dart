import 'package:flutter/material.dart';
import 'package:todoapp/src/screens/all_todos_screen.dart';
import 'package:todoapp/src/screens/new_todo_screen.dart';
import 'package:todoapp/src/screens/todos_screen.dart';

import '../screens/search_screen.dart';

class Routes {
  static Widget todosScreen = const TodosScreen();
  static Widget newTodoScreen = const NewTodoScreen();
  static Widget allTasksScreen = const AllTodosScreen();
  static Widget searchScreen = const SearchScreen();
}
