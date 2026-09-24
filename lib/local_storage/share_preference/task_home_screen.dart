import 'package:flutter/material.dart';
import 'package:flutter_practice/local_storage/share_preference/task_probider.dart';
import 'package:flutter_practice/local_storage/share_preference/widget/task_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice/local_storage/share_preference/add_task_screen.dart';
import 'package:flutter_practice/local_storage/task_model.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen> {
  final searchController = TextEditingController();

  final searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TaskProvider>(
          builder: (context, taskProvider, _) {
            final tasks = taskProvider.filteredTasks;

            return Column(
              children: [
                TextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  autofocus: false,
                  onChanged: (value) {
                    taskProvider.updateSearchQuery(value);
                  },
                  onTapOutside: (event) => searchFocusNode.unfocus(),

                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      TaskModel task = tasks[index];
                      return TaskCard(task: task);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
