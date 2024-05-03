import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';
import 'package:todoapp/src/constants/color_constants.dart';
import 'package:todoapp/src/providers/task_provider.dart';
import 'package:todoapp/src/router/router.dart';
import 'package:todoapp/src/router/routes.dart';
import 'package:todoapp/src/screens/all_completed_tasks.dart';
import 'package:todoapp/src/screens/all_todos_screen.dart';
import 'package:todoapp/src/screens/new_todo_screen.dart';
import 'package:todoapp/src/screens/search_screen.dart';
import 'package:todoapp/src/screens/todo_detail_screen.dart';
import 'package:todoapp/src/widgets/appbar_widget.dart';
import 'package:todoapp/src/widgets/headline_widget.dart';
import 'package:todoapp/src/widgets/task_tile_widget.dart';
import 'package:todoapp/src/widgets/textformfield_widget.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late TextEditingController searchTaskController;

  @override
  void initState() {
    super.initState();
    searchTaskController = TextEditingController();
  }

  @override
  void dispose() {
    searchTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarWidget(),
                const SizedBox(height: 4),
                TextFormFieldWidget(
                  readOnly: true,
                  controller: searchTaskController,
                  hintText: 'Search Task Here',
                  prefixIcon: const Icon(Icons.search),
                  bgColor: ConstantsColors.white12Color,
                  hintTextColor: ConstantsColors.whiteColor,
                  iconColor: ConstantsColors.whiteColor,
                  borderColor: ConstantsColors.greyColor,
                  width: MediaQuery.of(context).size.width,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen()));
                  },
                ),
                HeadlineWidget(title: 'Progress', buttonFunc: () {}),
                createProgressBar(),
                HeadlineWidget(
                    title: 'Tasks',
                    buttonFunc: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllTodosScreen()));
                    }),
                Container(
                  decoration: BoxDecoration(
                    color: ConstantsColors.white12Color,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Provider.of<TodoProvider>(context).todos.isNotEmpty
                      ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TodoDetailScreen(
                                              todo: Provider.of<TodoProvider>(
                                                      context)
                                                  .todos[index],
                                            )));
                              },
                              child: TaskTileWidget(
                                  todo: Provider.of<TodoProvider>(context)
                                      .todos[index],
                                  title: Provider.of<TodoProvider>(context)
                                      .todos[index]
                                      .name,
                                  date: Provider.of<TodoProvider>(context)
                                      .todos[index]
                                      .startDate,
                                  isCompleted:
                                      Provider.of<TodoProvider>(context)
                                          .todos[index]
                                          .alert),
                            );
                          }),
                          itemCount:
                              Provider.of<TodoProvider>(context).todos.length,
                        )
                      : const Center(
                          child: Text('Create New Task'),
                        ),
                ),
                HeadlineWidget(
                    title: 'Completed Tasks',
                    buttonFunc: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllCompletedTasks()));
                    }),
                Container(
                  decoration: BoxDecoration(
                    color: ConstantsColors.white12Color,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
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
                                              todo: Provider.of<TodoProvider>(
                                                      context)
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
                                  isCompleted:
                                      Provider.of<TodoProvider>(context)
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
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewTodoScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  createProgressBar() {
    var countOfTasks = Provider.of<TodoProvider>(context).todos.length;
    var countOfCompletedTasks =
        Provider.of<TodoProvider>(context).completedTodos.length;
    var per = ((countOfCompletedTasks / countOfCompletedTasks) / 100).toStringAsFixed(2);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ConstantsColors.white12Color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily Task',
            style: TextStyle(fontSize: 18),
          ),
          Text('$countOfCompletedTasks/$countOfTasks Task Completed',
              style: const TextStyle(fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('You are almost done go ahead',
                  style: TextStyle(fontSize: 14)),
              Text(per.toString()),
            ],
          ),
          const SizedBox(height: 5),
          SvgPicture.asset('lib/src/assets/vectors/progress_bar.svg')
        ],
      ),
    );
  }
}
