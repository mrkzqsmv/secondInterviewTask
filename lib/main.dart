import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/src/providers/task_provider.dart';
import 'package:todoapp/src/screens/todos_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TodosScreen(),
    );
  }
}
