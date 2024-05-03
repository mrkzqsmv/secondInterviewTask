import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/src/constants/color_constants.dart';
import 'package:todoapp/src/models/task_model.dart';
import 'package:todoapp/src/providers/task_provider.dart';
import 'package:todoapp/src/router/router.dart';
import 'package:todoapp/src/widgets/priority_box.dart';
import 'package:todoapp/src/widgets/textformfield_widget.dart';

class TodoDetailScreen extends StatefulWidget {
  final TaskModel todo;
  const TodoDetailScreen({super.key, required this.todo});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool acceessAlert = false;
  String priority = 'low';
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;

  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
  }

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
          title: Text(widget.todo.name),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  createTextBox(),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Start Time', style: TextStyle(fontSize: 20)),
                      TextFormFieldWidget(
                        readOnly: true,
                        bgColor: ConstantsColors.white12Color,
                        borderColor: ConstantsColors.white12Color,
                        hintText: widget.todo.startDate,
                        iconColor: ConstantsColors.purpleColor,
                        prefixIcon: const Icon(Icons.timelapse_outlined),
                      ),
                      const SizedBox(height: 10),
                      const Text('End Time', style: TextStyle(fontSize: 20)),
                      TextFormFieldWidget(
                        readOnly: true,
                        bgColor: ConstantsColors.white12Color,
                        borderColor: ConstantsColors.white12Color,
                        hintText: widget.todo.endDate,
                        iconColor: ConstantsColors.purpleColor,
                        prefixIcon: const Icon(Icons.timelapse_outlined),
                      ),
                      const SizedBox(height: 20),
                      const Text('Priority', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PriorityBox(
                            priorityLevel: 'High',
                            onTap: () {
                              priority = 'high';
                            },
                          ),
                          PriorityBox(
                            priorityLevel: 'Medium',
                            onTap: () {
                              priority = 'medium';
                            },
                          ),
                          PriorityBox(
                            priorityLevel: 'Low',
                            onTap: () {
                              priority = 'low';
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Get alert for this task',
                              style: TextStyle(fontSize: 16)),
                          Switch.adaptive(
                              thumbColor: const MaterialStatePropertyAll(
                                  ConstantsColors.whiteColor),
                              trackColor: const MaterialStatePropertyAll(
                                  ConstantsColors.purpleColor),
                              value: acceessAlert,
                              onChanged: (newValue) {
                                setState(() {
                                  acceessAlert = newValue;
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        backgroundColor: ConstantsColors.purpleColor,
                      ),
                      onPressed: () {
                          Provider.of<TodoProvider>(context, listen: false)
                              .removeTask(widget.todo);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Task removed successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Delete Task',
                        style: TextStyle(
                            color: ConstantsColors.whiteColor, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createTextBox() {
    return Wrap(
      runSpacing: 15,
      children: [
        const Text(
          'Schedule',
          style: TextStyle(fontSize: 22),
        ),
        TextFormFieldWidget(
            controller: nameController,
            readOnly: true,
            hintText: widget.todo.name,
            bgColor: ConstantsColors.white12Color,
            hintTextColor: ConstantsColors.whiteColor,
            iconColor: ConstantsColors.whiteColor,
            borderColor: ConstantsColors.white12Color),
        TextFormFieldWidget(
          controller: descriptionController,
          hintText: widget.todo.desc,
          readOnly: true,
          bgColor: ConstantsColors.white12Color,
          hintTextColor: ConstantsColors.whiteColor,
          iconColor: ConstantsColors.whiteColor,
          borderColor: ConstantsColors.white12Color,
        ),
      ],
    );
  }
}
