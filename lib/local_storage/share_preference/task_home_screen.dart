import 'package:flutter/material.dart';
import 'package:flutter_practice/local_storage/share_preference/task_probider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice/local_storage/share_preference/add_task_screen.dart';
import 'package:flutter_practice/local_storage/task_model.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          final tasks = taskProvider.tasks;

          if (tasks.isEmpty) {
            return const Center(child: Text("No tasks found. Add some!"));
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              TaskModel task = tasks[index];
              return ListTile(
                title: Text("${index + 1}. ${task.title}"),
                subtitle: Text(task.description ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: task.isDone,
                      onChanged: (value) {
                        context.read<TaskProvider>().toggleTaskStatus(index);
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        // Delete task using provider
                        context.read<TaskProvider>().deleteTask(index);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
