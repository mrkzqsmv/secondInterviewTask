import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/src/models/task_model.dart';
import 'package:todoapp/src/providers/task_provider.dart';
import '../constants/color_constants.dart';
import '../router/router.dart';
import '../widgets/textformfield_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTaskController;

  @override
  void initState() {
    super.initState();
    searchTaskController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchTaskController.dispose();
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
          title: const Text('Search Tasks'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormFieldWidget(
                controller: searchTaskController,
                hintText: 'Search Task Here',
                prefixIcon: const Icon(Icons.search),
                bgColor: ConstantsColors.white12Color,
                hintTextColor: ConstantsColors.whiteColor,
                iconColor: ConstantsColors.whiteColor,
                borderColor: ConstantsColors.greyColor,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
